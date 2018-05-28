require File.expand_path('lib/omniauth/strategies/eurosignal', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider ENV['PROVIDER_NAME'], ENV['PROVIDER_APP_ID'], ENV['PROVIDER_SECRET'], { provider_ignores_state: true }
end
