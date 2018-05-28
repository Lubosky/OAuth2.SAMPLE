require "application_responder"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  self.responder = ApplicationResponder
  respond_to :html

  before_action :authenticate_user!

  helper_method :current_user, :signed_in?

  rescue_from OAuth2::Error do |exception|
    if exception.response.status == 401
      session[:user_id] = nil
      session[:access_token] = nil
      redirect_to authorize_path, alert: "Access token expired, try signing in again."
    end
  end

  def access_token
    if session[:access_token]
      @access_token ||= OAuth2::AccessToken.new(oauth_client, session[:access_token])
    end
  end

  def api_user
    access_token.get("/profile").parsed if access_token
  end

  private

  def oauth_client
    @oauth_client ||= OAuth2::Client.new(ENV['PROVIDER_APP_ID'], ENV['PROVIDER_SECRET'], site: ENV['PROVIDER_APP_URL'])
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !session[:access_token].nil? 
  end

  def authenticate_user!
    redirect_to authorize_path unless api_user.present?
  end
end