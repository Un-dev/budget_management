class BudgetsController < ApplicationController
  before_action :find_budget, except: %i[index new create]
  def index
    if params[:budget_id].nil?
      @current_budget = Budget.current_month_budget
    else
      @current_budget = Budget.find(params[:budget_id])
    end
    @expenses = @current_budget.expenses.includes(:category).all
  end

  private def find_budget
    @budget = Budget.find(params[:budget_id])
  end
end
