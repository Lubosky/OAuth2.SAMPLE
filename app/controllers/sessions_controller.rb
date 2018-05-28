class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    user = User.find_or_create_by(provider: auth["provider"], uid: auth["uid"], email: auth&.info&.email)
    session[:access_token] = auth['credentials']['token']
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:access_token] = nil
    session[:user_id] = nil
    redirect_to authorize_url
  end

  private

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
