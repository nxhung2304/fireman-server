module Fireman
  class News
    SLACK_CHANNEL = "#fireman-news"

    def initialize
      @slack_bot = SlackBot.new(SLACK_CHANNEL)
    end

    def call
      q = "Gold price"
      msg = Datasource::News::NewsApi.new.call(q)
      @slack_bot.send_message(msg)
    end
  end
end
