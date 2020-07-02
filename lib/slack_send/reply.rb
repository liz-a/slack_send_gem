module SlackSend
  class Reply
    attr_reader :response_url, :message, :attachments, :response_type
    private :response_url, :message, :attachments, :response_type

    def initialize(response_url:, message:, attachments:, response_type:)
      @response_url = response_url
      @message = message
      @attachments = attachments
      @response_type = response_type
    end

    def self.send(response_url:, message:, attachments:, response_type:)
      new(
        response_url: response_url,
        message: message,
        attachments: attachments,
        response_type: response_type
      ).send
    end

    def send
      HTTParty.post(response_url,
        {
          body: body,
          headers: {
            "Content-Type" => "application/json"
          }
        }
      )
    end

    private

    def body
      {
        "text" => "#{message}",
        "response_type" => "#{response_type}",
        "attachments" => attachments
      }.to_json
    end
  end
end
