class SplashPageController < ApplicationController
  def index
    redirect_to categories_path, notice: 'you are already logged in' if user_signed_in?
  end
end
