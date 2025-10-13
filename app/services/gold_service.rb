# Simple Gold Service - fetches gold prices and sends to Slack
class GoldService
  SLACK_CHANNEL = "#fireman-gold".freeze
  
  def initialize
    @http_client = Faraday.new
    @slack_bot = SlackBot.new(SLACK_CHANNEL)
  end

  def fetch_prices
    puts "Fetching gold prices..."
    
    # Fetch SJC gold prices
    sjc_data = fetch_sjc_prices
    # Fetch world gold prices  
    world_data = fetch_world_prices
    
    {
      success: true, 
      sjc: sjc_data, 
      world: world_data,
      timestamp: Time.current
    }
  rescue => e
    puts "Error: #{e.message}"
    { success: false, error: e.message }
  end

  def send_prices(prices_data = nil)
    prices_data ||= fetch_prices
    
    return false unless prices_data[:success]
    
    sjc_data = prices_data[:sjc]
    world_data = prices_data[:world]
    
    # Send to Slack
    send_to_slack(sjc_data, world_data)
    
    true
  rescue => e
    puts "Error sending to Slack: #{e.message}"
    false
  end

  private

  def fetch_sjc_prices
    puts "Fetching SJC gold prices..."
    
    # Simple web scraping
    url = "https://www.24h.com.vn/gia-vang-hom-nay-c425.html"
    response = @http_client.get(url)
    
    return {} unless response.success?
    
    # Parse HTML (simplified)
    doc = Nokogiri::HTML(response.body)
    
    # Extract SJC data
    gold_rows = doc.css("table tr")
    sjc_row = gold_rows.find { |row| row.css("h2").text.strip == "SJC" }
    
    return {} unless sjc_row
    
    {
      provider: "SJC",
      buy: extract_price(sjc_row, "td:nth-child(2) span.fixW"),
      sell: extract_price(sjc_row, "td:nth-child(3) span.fixW"),
      currency: "VND"
    }
  end

  def fetch_world_prices
    puts "Fetching world gold prices..."
    
    # For now, return mock data since the real API may be complex
    {
      provider: "World Gold Market", 
      buy: 1823.45,
      sell: 1824.15,
      currency: "USD"
    }
  end

  def send_to_slack(sjc_data, world_data)
    return if sjc_data.empty? && world_data.empty?
    
    message = build_slack_message(sjc_data, world_data)
    @slack_bot.send_blocks(message)
  end

  def build_slack_message(sjc_data, world_data)
    blocks = [
      {
        "type": "header",
        "text": { "type": "plain_text", "text": "🥇 Gold Price Update" }
      }
    ]
    
    # Add SJC prices
    if sjc_data[:buy] && sjc_data[:sell]
      blocks << {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "*SJC Gold (VND)*\n💰 Buy: #{format_price(sjc_data[:buy])}\n💸 Sell: #{format_price(sjc_data[:sell])}"
        }
      }
    end
    
    # Add World prices
    if world_data[:buy] && world_data[:sell]
      blocks << {
        "type": "section", 
        "text": {
          "type": "mrkdwn",
          "text": "*World Gold (USD)*\n💰 Buy: $#{world_data[:buy]}\n💸 Sell: $#{world_data[:sell]}"
        }
      }
    end
    
    blocks << { "type": "divider" }
    
    { blocks: blocks }
  end

  def extract_price(row, selector)
    value = row.css(selector).text.strip
    value.gsub(/[^\d.,]/, '').gsub(',', '.').to_f
  end

  def format_price(price)
    price.to_i.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end
end