require "slack-ruby-client"

module Fireman
  class Gold
    SLACK_CHANNEL = "#fireman-gold".freeze

    def initialize
      @slack_bot = SlackBot.new(SLACK_CHANNEL)
    end

    def call
      sjc_blocks = Datasource::Gold::Sjc.new.call
      world_blocks = Datasource::Gold::World.new.call

      @slack_bot.send_blocks(world_blocks)
      @slack_bot.send_blocks(sjc_blocks)
    end
  end
end
