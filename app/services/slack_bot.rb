class SlackBot
  def initialize(channel = '#general')
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
    end

    @client = Slack::Web::Client.new
    @channel = channel
  end

  def send_message(msg)
    return if msg.blank?

    begin
      @client.chat_postMessage(
        channel: @channel,
        text: msg,
        as_user: true
      )
      puts "Message sent to #{@channel}!"
    rescue Slack::Web::Api::Errors::NotInChannel => e
      puts "Error: Bot not in #{@channel}. Invite bot first."
    rescue Slack::Web::Api::Errors::SlackError => e
      puts "Slack API Error: #{e.message}"
    end
  end
end
