module OmniAuth
  module Strategies
    class Eurosignal < OmniAuth::Strategies::OAuth2
      option :name, ENV['PROVIDER_NAME']

      option :client_options, {
        site: ENV['PROVIDER_APP_URL']
      }

      uid do
        raw_info['id']
      end

      info do
        { email: raw_info['email'] }
      end

      def client
        ::OAuth2::Client.new(options.client_id, options.client_secret, deep_symbolize(options.client_options))
      end

      def access_token
        @access_token ||= OAuth2::AccessToken.new(client, session[:access_token])
      end

      def callback_url
        URI.join(ENV['APP_URL'], ENV['APP_OAUTH_CALLBACK'])
      end

      def raw_info
        @raw_info ||= access_token.get('/profile').parsed
      end
    end
  end
end
