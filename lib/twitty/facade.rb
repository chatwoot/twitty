# frozen_string_literal: true

module Twitty
  class Facade
    include Twitty::Constants

    def initialize
      yield(config) if block_given?
    end

    API_CONFIG.each do |action, _config|
      define_method action do |data = {}|
        define_actions(action, data)
      end
    end

    private

    def define_actions(action, data)
      response = send_request(api_url(action, data), api_method(action),
                              api_params(action, data))

    end

    private

    def api_params(action, data)
      #Twitty::ParamsBuilder.build(action, data, config)
      data
    end

    def send_request(url, type, params)
      Twitty::Request.new(url: url, type: type, payload: params, config: config).execute
    end

    def config
      @config ||= Twitty::Config.new
    end

    def api_url(action, data)
      "#{config.base_url}#{API_CONFIG[action][:endpoint]}" % data
    end

    def api_method(action)
      API_CONFIG[action][:method]
    end
  end
end
