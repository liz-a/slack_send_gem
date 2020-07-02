module SlackSend
  class Send
    attr_reader :user_id, :message, :attachments
    private :user_id, :message, :attachments

    def initialize(user_id:, message:, attachments:)
      @user_id = user_id
      @message = message
      @attachments = attachments
    end

    def self.send(user_id:, message:, attachments:)
      new(
        user_id: user_id,
        message: message,
        attachments: attachments
      ).send
    end

    def send
      open_im

      HTTParty.post("https://slack.com/api/chat.postMessage",
        {
          body: {
            "text" => "#{message}",
            "channel" => "#{channel}",
            "attachments" => attachments
          }.to_json,
          headers: json_headers
        }
      )
    end

    private

    def open_im
      HTTParty.post("https://slack.com/api/im.open",
        {
          body: {"user" => "#{user_id}"}.to_json,
          headers: json_headers
        }
      )
    end

    def channel
      im_list['ims'].select { |user| user['user'] == user_id }.first['id']
    end

    def im_list
      HTTParty.post("https://slack.com/api/im.list",
        {
          headers: json_headers
        }
      )
    end

    def json_headers
      {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{token}"
      }
    end

    def token
      Configuration.instance.bot_token
    end
  end
end
