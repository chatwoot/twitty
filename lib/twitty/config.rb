module Twitty
  class Config
    attr_accessor :consumer_key,
                  :consumer_secret,
                  :access_token,
                  :access_token_secret,
                  :base_url,
                  :open_timeout,
                  :open_timeout
               

    def initialize(params = {})
      @base_url = params[:base_url]

      @consumer_key = params[:consumer_key]
      @consumer_secret = params[:consumer_secret]
      @access_token = params[:access_token]
      @access_token_secret = params[:access_token_secret]

      @open_timeout = params[:open_timeout]
      @read_timeout = params[:read_timeout]
    end
  end
end
