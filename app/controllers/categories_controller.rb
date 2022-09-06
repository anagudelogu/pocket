class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.where(user: current_user)
  end

  def new
    @category = current_user.categories.build
  end
end
