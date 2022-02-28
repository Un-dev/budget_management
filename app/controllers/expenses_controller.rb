class ExpensesController < ApplicationController
  before_action :find_expense, except: %i[index new create]
  def index
    @expenses=Expense.all
  end

  def new
    @expense = Expense.new
  end

  def edit
  end
  
  def find_expense
    @expense = Expense.includes(:budget).find(params[:id])
  end
end
