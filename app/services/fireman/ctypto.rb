module Fireman
  class Crypto
    SLACK_CHANNEL = "#fireman-crypto"

    def initialize
      @slack_bot = SlackBot.new(SLACK_CHANNEL)
    end

    def send_btc
      msg_btc = "BTC: 121K USDT"
      @slack_bot.send_message(msg_btc)
    end
  end
end
