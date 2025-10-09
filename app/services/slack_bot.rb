class SlackBot
  def initialize(channel = "#general")
    Slack.configure do |config|
      config.token = ENV["SLACK_API_TOKEN"]
    end

    @client = Slack::Web::Client.new
    @channel = channel
  end

  def send_blocks(blocks)
    @client.chat_postMessage(
      channel: @channel,
      blocks: blocks
    )
  end

  def send_message(text)
    @client.chat_postMessage(channel: @channel, text: text)
  end
end
