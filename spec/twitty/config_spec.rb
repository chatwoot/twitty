# frozen_string_literal: true

RSpec.describe Twitty::Config do
  describe 'Initialization' do
    before :all do
      @params = {
        consumer_key: 'TEST_CONSUMER_KEY',
        consumer_secret: 'TEST_CONSUMER_SECRET',
        access_token: 'TEST_ACCESS_TOKEN',
        access_token_secret: 'TEST_ACCESS_SECRET',
        base_url: 'https://api.twitter.com/',
        open_timeout: 30,
        open_timeout: 30,
      }

      @config = Twitty::Config.new(@params)
    end

    it 'should create instance' do
      expect(@config).to be_a Twitty::Config
    end

    it 'should set consumer_key' do
      expect(@config.consumer_key).to eql @params[:consumer_key]
    end

    it 'should set consumer secret' do
      expect(@config.consumer_secret).to eql @params[:consumer_secret]
    end

    it 'should set access token' do
      expect(@config.access_token).to eql @params[:access_token]
    end

    it 'should set access token secret' do
      expect(@config.access_token_secret).to eql @params[:access_token_secret]
    end
  end
end

