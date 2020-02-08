module Twitty
  module Payload
    EMPTY_PAYLOAD_ACTIONS = %w[fetch_webhooks register_webhook subscribe_webhook unsubscribe_webhook].freeze

    EMPTY_PAYLOAD_ACTIONS.each do |action|
      define_method "#{action.to_s}_payload" do
        {}
      end
    end

    def build_payload(action, payload)
      @payload = payload
      send("#{action.to_s}_payload")
    end

    def send_direct_message_payload
      {
        "event": {
          "type": "message_create",
          "message_create": {
            "target": {
              "recipient_id": @payload[:recipient_id]
            },
            "message_data": {
              "text": @payload[:message]
            }
          }
        }
      }.to_json
    end

    def send_tweet_reply_payload
      {
        "status": @payload[:tweet],
        "in_reply_to_status_id": @payload[:reply_to_tweet_id]
      }
    end

    def request_oauth_token_payload
      {
        oauth_callback: @payload[:url]
      }
    end

    def access_token_payload
      {
        oauth_verifier: @payload[:oauth_verifier]
      }
    end
  end
end
