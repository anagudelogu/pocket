class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses.order(id: :desc)
  end

  def new; end
end
