require "slack-ruby-client"

module Fireman
  class Gold
    SLACK_CHANNEL = "#fireman-gold".freeze

    def initialize
      @slack_bot = SlackBot.new(SLACK_CHANNEL)
    end

    def call
      blocks = Datasource::Gold::Sjc.new.call

      @slack_bot.send_blocks(blocks)
    end
  end
end
