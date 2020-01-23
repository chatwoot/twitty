# frozen_string_literal: true
module Twitty
  module Constants
    API_CONFIG = {
      fetch_webhooks: {
        method: :get,
        endpoint: '/1.1/account_activity/all/chatwootdev/webhooks.json',
        required_params: []
      },

      register_webhook: {
        method: :post,
        endpoint: '/1.1/account_activity/all/chatwootdev/webhooks.json?url=%{url}',
        required_params: [:url]
      }
  }.freeze
  end
end