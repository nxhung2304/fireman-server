module Fireman
  # Legacy News class - use ServiceContainer.news_service instead
  # This class is kept for backward compatibility
  class News
    SLACK_CHANNEL = "#fireman-news"

    def initialize
      @slack_bot = SlackBot.new(SLACK_CHANNEL)
      puts "[DEPRECATED] Fireman::News is deprecated. Use Services.notify_news(query) instead."
    end

    def send_news(query = "bitcoin")
      # Use the new service architecture
      result = Services.notify_news(query)
      
      if result[:success]
        "News successfully processed and delivered"
      else
        "Failed to process news: #{result[:error]}"
      end
    end
  end
end
