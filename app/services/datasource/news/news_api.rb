module Datasource
  module News
    class NewsApi
      MAXIMUM_RESULT = 3
      BASE_URL = "https://newsapi.org"
      DATE_FORMAT_STRING = "%Y-%m-%d"
      PRIMARY_LANGUAGE = "en"
      ENDPOINT = "/v2/everything"

      def call(q)
        raise ArgumentError, "Query cannot be blank" if q.blank?

        token = ENV["NEWSAPI_TOKEN"]
        raise ArgumentError, "NEWSAPI_TOKEN environment variable is required" if token.blank?

        conn = Faraday.new(
          url: BASE_URL,
          headers: {
            "X-Api-Key" => token
          }
        )

        params = build_params(q)
        full_url = conn.build_url(ENDPOINT, params)
        puts "Full URL: #{full_url}"

        response = conn.get(ENDPOINT, params)

        puts "Status: #{response.status}"

        if response.success?
          parsed_body = parse_json(response.body)
          { data: parsed_body, success: true }
        else
          puts "API Error: #{response.status} - #{response.body}"
          { error: "API request failed with status #{response.status}", success: false }
        end
      end

      private

      def build_params(q)
        {
          q: q,
          language: PRIMARY_LANGUAGE,
          from: yesterday_formatted,
          to: today_formatted,
          pageSize: MAXIMUM_RESULT
        }
      end

      def today_formatted
        Time.now.strftime(DATE_FORMAT_STRING)
      end

      def yesterday_formatted
        Date.yesterday.strftime(DATE_FORMAT_STRING)
      end

      def parse_json(body)
        JSON.parse(body)
      rescue JSON::ParserError => e
        puts "JSON Parse Error: #{e.message}"
        raise StandardError, "Failed to parse API response"
      end
    end
  end
end
