module Fireman
  class Gold
    SLACK_CHANNEL = "#fireman-gold"

    def initialize
      @slack_bot = SlackBot.new(SLACK_CHANNEL)
    end

    def send_gold
      msg = "GOLD: 4000 USD / Ounce"
      @slack_bot.send_message(msg)
    end
  end
end
