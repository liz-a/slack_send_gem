require 'singleton'

module SlackSend
  class Configuration
    include Singleton
    attr_accessor :bot_token
  end
end
