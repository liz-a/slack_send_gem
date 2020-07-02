require 'slack_send'

RSpec.configure do |config|
  config.color = true

  config.before :suite do
    SlackSend::Configuration.instance.bot_token = 'BOT342356789'
  end
end
