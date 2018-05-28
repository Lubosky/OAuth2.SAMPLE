class OauthController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  layout 'authentication'

  def index; end
end
