module Datasource
  module News
    class TheNewsApi
      MAXIMUM_RESULT = 3
      BASE_URL = "https://api.thenewsapi.com"
      DATE_FORMAT_STRING = "%Y-%m-%d"
      PRIMARY_LANGUAGE = "en"
      ENDPOINT = "v1/news/top"

      def call(q)
        raise ArgumentError, "Query cannot be blank" if q.blank?

        token = ENV["THENEWSAPI_TOKEN"]
        raise ArgumentError, "NEWSAPI_TOKEN environment variable is required" if token.blank?

        conn = Faraday.new(
          url: BASE_URL,
        )

        params = build_params(q, token)
        full_url = conn.build_url(ENDPOINT, params)
        puts "Full URL: #{full_url}"

        response = conn.get(ENDPOINT, params)

        puts "Status: #{response.status}"
        puts "Body: #{parse_json(response.body)}"
      end

      private

      def build_params(q, token)
        {
          search: q,
          language: PRIMARY_LANGUAGE,
          published_on: today_formatted,
          limit: MAXIMUM_RESULT,
          api_token: token
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
