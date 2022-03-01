class BudgetsController < ApplicationController
  def index
    if params[:budget_id].nil?
      @current_budget = Budget.current_month_budget
    else
      @current_budget = Budget.find(params[:budget_id])
    end
    @expenses = @current_budget.expenses.includes(:category).all
  end

  def next
    redirect_to url_for(
                  action: :index,
                  controller: :budgets,
                  budget_id: Budget.next(params[:budget_id]),
                )
  end

  def previous
    redirect_to url_for(
                  action: :index,
                  controller: :budgets,
                  budget_id: Budget.previous(params[:budget_id]),
                )
  end
end
