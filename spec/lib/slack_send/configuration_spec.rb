require 'spec_helper'

module SlackSend
  describe Configuration do
    subject(:configuration) { Configuration.instance }
    let(:this) { [1,2,3] }
    let(:that) { [1,2,3] }

    it 'is a singleton' do
      expect(configuration).to equal(configuration)
    end

    describe '#bot_token' do
      it 'allows the bot token to be retrieved' do
      end
    end

    describe '#bot_token=' do
      before { configuration.bot_token = 'altered' }
      after { configuration.bot_token = 'BOT342356789' }

      it 'allows the bot token to be set' do
        expect(configuration.bot_token).to eql('altered')
      end
    end
  end
end
