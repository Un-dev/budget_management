class ExpensesController < ApplicationController
  before_action :find_expense, except: %i[index new create]
  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to url_for(controller: :users, action: :index)
    else
      render :new
    end
  end

  def edit
    @expense.update(expense_params)
  end

  def find_expense
    @expense = Expense.includes(:budget).find(params[:id])
  end

  def expense_params
    params
      .require(:expense)
      .permit(:title, :date, :amount, :category_id, :account_id)
  end
end
