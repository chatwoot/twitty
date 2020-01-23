require 'oauth'
require 'json'
require 'pry'

module Twitty
  class Request
    attr_reader :url, :type, :payload, :config

    HEADERS = {"content-type" => "application/json"}

    def self.execute(params)
      new(params)
    end

    def initialize(params)
      @url = params[:url]
      @type = params[:type]
      @payload = params[:payload]
      @config = params[:config]
    end

    def execute
      send("api_#{type}")
    end

    private

    def api_client
      @api_client ||= begin
        consumer = OAuth::Consumer.new(config.consumer_key, config.consumer_secret, {:site => config.base_url})
        token = {:oauth_token => config.access_token, :oauth_token_secret => config.access_token_secret }
        OAuth::AccessToken.from_hash(consumer, token)
      end
    end

    def api_get
      api_client.get(url, HEADERS)
    end

    def api_post
      api_client.post(url, payload, HEADERS)
    end
  end
end
