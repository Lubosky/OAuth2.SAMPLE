class ProfileController < ApplicationController
  def show
    respond_with(current_user)
  end
end
