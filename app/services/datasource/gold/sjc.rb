module Datasource
  module Gold
    class Sjc
      URL = "https://www.24h.com.vn/gia-vang-hom-nay-c425.html"

      def call
        document = Nokogiri::HTML(URI.open(URL, "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"))

        gold_rows = document.css("table tr")
        sjc_row = gold_rows.find { |row| row.css("h2").text.strip == "SJC" }

        return [] unless sjc_row

        row_data = build_row(sjc_row)
        blocks = build_table_blocks([ row_data ])

        blocks
      end

      private

        def build_row(row)
          name = row.css("h2").text.strip
          buy_today = row.css("td:nth-child(2) span.fixW").text.strip
          sell_today = row.css("td:nth-child(3) span.fixW").text.strip
          buy_yesterday = row.css("td:nth-child(4)").text.strip
          sell_yesterday = row.css("td:nth-child(5)").text.strip

          {
            provider: name,
            buy_today: buy_today,
            sell_today: sell_today,
            buy_yesterday: buy_yesterday,
            sell_yesterday: sell_yesterday,
            change: (buy_today == buy_yesterday && sell_today == sell_yesterday) ? "Không đổi" : "Thay đổi"
          }
        end

        def build_table_blocks(rates)
          date = Time.current.strftime("%d/%m/%Y")
          blocks = [
            {
              type: "header",
              text: {
                type: "plain_text",
                text: "📈 Giá Vàng SJC Hôm Nay (#{date})"
              }
            }
          ]

          rates.each do |rate|
            blocks << {
              type: "section",
              fields: [
                { type: "mrkdwn", text: "*#{rate[:provider]}*" },
                { type: "mrkdwn", text: "Mua: `#{rate[:buy_today]}`" },
                { type: "mrkdwn", text: "Bán: `#{rate[:sell_today]}`" },
                { type: "mrkdwn", text: "Thay đổi: `#{rate[:change]}`" }
              ]
            }
          end

          blocks
        end
    end
  end
end
