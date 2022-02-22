class BudgetsController < ApplicationController
  def index
    @current_budget=Budget.current_month_budget
    @expenses=@current_budget.expenses.all
  end
end
