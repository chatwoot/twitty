RSpec.describe Twitty::Request do
  before :all do
    config_params = {
      consumer_key: 'TEST_CONSUMER_KEY',
      consumer_secret: 'TEST_CONSUMER_SECRET',
      access_token: 'TEST_ACCESS_TOKEN',
      access_token_secret: 'TEST_ACCESS_SECRET',
      base_url: 'https://api.twitter.com/',
      environment: 'chatwoot_test'
    }

    @config = Twitty::Config.new(config_params)

    @params = { config: @config,
                url: 'https://api.twitter.com/test',
                payload: { test: 'test' } }
  end

  it 'creates instance' do
    request = Twitty::Request.new(@params)
    expect(request).to be_a Twitty::Request
  end

  it 'sends get request' do
    get_params = @params.merge(type: 'get')
    request = Twitty::Request.new(get_params)

    expect(request).to receive(:api_get).once
    request.execute
  end

  it 'sends post request' do
    post_params = @params.merge(type: 'post')
    request = described_class.new(post_params)

    expect(request).to receive(:api_post).once
    request.execute
  end
end
