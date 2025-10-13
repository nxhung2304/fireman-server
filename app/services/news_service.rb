# Simple News Service - fetches news and sends to Slack
class NewsService
  SLACK_CHANNEL = "#fireman-news".freeze
  
  def initialize
    @http_client = Faraday.new
    @slack_bot = SlackBot.new(SLACK_CHANNEL)
  end

  def fetch_news(query = "bitcoin")
    puts "Fetching news for: #{query}"
    
    # Fetch news from multiple sources
    articles = []
    
    # Try News API
    news_api_articles = fetch_from_news_api(query)
    articles.concat(news_api_articles) if news_api_articles.any?
    
    # Try other sources if needed
    # other_articles = fetch_from_other_sources(query)
    # articles.concat(other_articles) if other_articles.any?
    
    { 
      success: true, 
      query: query, 
      article_count: articles.count,
      articles: articles,
      timestamp: Time.current
    }
  rescue => e
    puts "Error: #{e.message}"
    { success: false, error: e.message }
  end

  def send_news(news_data = nil)
    news_data ||= fetch_news
    
    return false unless news_data[:success]
    
    articles = news_data[:articles]
    query = news_data[:query]
    
    # Send to Slack
    send_to_slack(articles, query)
    
    true
  rescue => e
    puts "Error sending to Slack: #{e.message}"
    false
  end

  private

  def fetch_from_news_api(query)
    api_key = ENV["NEWSAPI_TOKEN"]
    return [] unless api_key
    
    puts "Fetching from News API..."
    
    url = "https://newsapi.org/v2/everything"
    params = {
      q: query,
      language: "en",
      from: 1.day.ago.strftime("%Y-%m-%d"),
      to: Date.current.strftime("%Y-%m-%d"),
      pageSize: 5
    }
    
    response = @http_client.get(url, params) do |req|
      req.headers["X-Api-Key"] = api_key
    end
    
    return [] unless response.success?
    
    data = JSON.parse(response.body)
    data["articles"] || []
  rescue => e
    puts "News API error: #{e.message}"
    []
  end

  def send_to_slack(articles, query)
    return if articles.empty?
    
    message = build_slack_message(articles, query)
    @slack_bot.send_blocks(message)
  end

  def build_slack_message(articles, query)
    blocks = [
      {
        "type": "header",
        "text": { "type": "plain_text", "text": "📰 News Update: #{query.capitalize}" }
      }
    ]
    
    # Add articles
    articles.first(5).each_with_index do |article, index|
      blocks << {
        "type": "section",
        "text": {
          "type": "mrkdwn", 
          "text": "*#{index + 1}. #{article["title"]}*\n#{article["description"]}"
        }
      }
      
      blocks << {
        "type": "context",
        "elements": [
          {
            "type": "mrkdwn",
            "text": "📅 #{format_date(article["publishedAt"])} | 🌐 #{article["source"]["name"]}"
          }
        ]
      }
      
      blocks << { "type": "divider" }
    end
    
    { blocks: blocks }
  end

  def format_date(date_string)
    return "Unknown" unless date_string
    
    date = Date.parse(date_string) rescue Date.current
    date.strftime("%b %d, %Y")
  end
end