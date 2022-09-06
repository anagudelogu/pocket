class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.where(user: current_user)
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to categories_path
    else
      flash.now[:alert] = @category.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
