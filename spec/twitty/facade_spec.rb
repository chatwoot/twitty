# frozen_string_literal: true

RSpec.describe Twitty::Facade do
  before :all do
    @facade = Twitty::Facade.new do |config|
      config.consumer_key = 'TEST_CONSUMER_KEY'
      config.consumer_secret = 'TEST_CONSUMER_SECRET'
      config.access_token = 'TEST_ACCESS_TOKEN'
      config.access_token_secret = 'TEST_ACCESS_SECRET'
      config.base_url = 'https://api.twitter.com/'
      config.environment = 'chatwoot_test'
    end
  end

  describe 'Initialization' do
    it 'creates instance' do
      expect(@facade).to be_a described_class
    end

    it 'sets config' do
      expect(@facade.send('config')).to be_a Twitty::Config
    end
  end
end
