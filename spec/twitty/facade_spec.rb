# frozen_string_literal: true

RSpec.describe Twitty::Facade do
  
  before :all do
    @facade = Twitty::Facade.new do |config|
      config.consumer_key = 'TEST_CONSUMER_KEY'
      config.consumer_secret = 'TEST_CONSUMER_SECRET'
      config.access_token = 'TEST_ACCESS_TOKEN'
      config.access_token_secret = 'TEST_ACCESS_SECRET'
      config.base_url = 'https://api.twitter.com/'
      config.open_timeout = 30
      config.read_timeout = 30
    end
  end

  describe 'Initialization' do
    it 'should create instance' do
      expect(@facade).to be_a Twitty::Facade
    end

    it 'should set config' do
      expect(@facade.send('config')).to be_a Twitty::Config
    end
  end
end
