require "open-uri"
require "nokogiri"

module Datasource
  module Gold
    class World
      URL = "https://giavang.org/the-gioi/".freeze

      def call
        document = Nokogiri::HTML(URI.open(URL, "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"))

        price_elements = document.css(".crypto-price")
        price_element = price_elements.first

        return [] unless price_element

        data = build_data(price_element)
        blocks = build_table_blocks([ data ])

        blocks
      end

      private

      def build_data(price_element)
        spot_price = price_element["data-price"] || price_element.text.strip
        spot_price = "#{spot_price} USD/Ounce" unless spot_price.include?("USD")

        parent_text = price_element.parent&.text || ""
        expanded_text = price_element.ancestors("div")&.text || parent_text

        change_match = expanded_text.match(/([+-]?[\d,]+(?:\.\d{2})?)\s*USD\s*\(([+-]?\d+(?:\.\d{2})?%)?\)/)
        change_usd = change_match ? change_match[1] : "N/A"
        change_pct = change_match ? change_match[2] : "N/A"

        {
          spot_price: spot_price,
          change_usd: change_usd,
          change_pct: change_pct
        }
      end

        def build_table_blocks(rates)
          today = Time.current.strftime("%d/%m/%Y")
          blocks = [
            {
              type: "header",
              text: {
                type: "plain_text",
                text: "🌍 Giá Vàng Thế Giới Hôm Nay (#{today})"
              }
            }
          ]
          rates.each do |item|
            blocks << {
              type: "section",
              fields: [
                { type: "mrkdwn", text: "*Spot Price*" },
                { type: "mrkdwn", text: "`#{item[:spot_price]}`" }
              ]
            }
          end
          blocks
        end
    end
  end
end
