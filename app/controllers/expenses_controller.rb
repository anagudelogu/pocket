class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses.order(id: :desc)
  end

  def new
    load_new_variables
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      @expense.categories << categories
      redirect_to category_expenses_path(params[:category_id]), notice: 'Succesfully created'
    else
      flash.now[:alert] = @expense.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end

  def categories
    main_category = Category.find(params[:category_id])

    extra_categories = params[:categories] ? Category.where(id: params[:categories][:category_ids]).to_a : []
    categories = []

    categories << main_category << extra_categories
    categories.flatten
  end

  def load_new_variables
    @category = Category.find(params[:category_id])
    @expense = current_user.expenses.build
  end
end
