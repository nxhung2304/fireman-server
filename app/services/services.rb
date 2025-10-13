# Simple Service Container - easy to use and understand
module Services
  # Get gold service
  def self.gold
    @gold_service ||= GoldService.new
  end
  
  # Get news service
  def self.news
    @news_service ||= NewsService.new
  end
  
  # Quick methods for common tasks
  def self.notify_gold_prices
    gold_service = gold
    prices = gold_service.fetch_prices
    gold_service.send_prices(prices)
    prices
  end
  
  def self.notify_news(query = "bitcoin")
    news_service = news
    news_data = news_service.fetch_news(query)
    news_service.send_news(news_data)
    news_data
  end
  
  # Individual methods for more control
  def self.fetch_gold_prices
    gold.fetch_prices
  end
  
  def self.send_gold_prices(prices_data = nil)
    gold.send_prices(prices_data)
  end
  
  def self.fetch_news(query = "bitcoin")
    news.fetch_news(query)
  end
  
  def self.send_news(news_data = nil)
    news.send_news(news_data)
  end
  
  # Reset cached services (useful for testing)
  def self.reset!
    @gold_service = nil
    @news_service = nil
  end
end