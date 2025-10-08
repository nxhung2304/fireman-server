module Fireman
  class News
    SLACK_CHANNEL = "#fireman-news"

    def initialize
      @slack_bot = SlackBot.new(SLACK_CHANNEL)
    end

    def send_news
      msg = "News: BTC ATH"
      @slack_bot.send_message(msg)
    end
  end
end
