require "slack-ruby-client"

module Fireman
  # Legacy Gold class - use ServiceContainer.gold_service instead
  # This class is kept for backward compatibility
  class Gold
    SLACK_CHANNEL = "#fireman-gold".freeze

    def initialize
      @slack_bot = SlackBot.new(SLACK_CHANNEL)
      puts "[DEPRECATED] Fireman::Gold is deprecated. Use Services.notify_gold_prices instead."
    end

    def call
      # Use the new service architecture
      result = Services.notify_gold_prices

      if result[:success]
        "Gold prices successfully processed and delivered"
      else
        "Failed to process gold prices: #{result[:error]}"
      end
    end
  end
end
