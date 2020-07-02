module SlackSend
  require 'httparty'
  Dir[File.join(__dir__, 'slack_send', '*.rb')].each { |file| require file }

  def self.configure
    yield(Configuration.instance)
  end

  def self.reply(response_url:, message:, attachments: [], response_type: 'ephemeral')
    Reply.send(
      response_url: response_url,
      message: message,
      attachments: attachments,
      response_type: response_type
    )
  end

  def self.send(user_id:, message:, attachments: [])
    Send.send(
      user_id: user_id,
      message: message,
      attachments: attachments
    )
  end
end
