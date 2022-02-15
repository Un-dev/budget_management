class BudgetsController < ApplicationController
  def index
    @current_budget=Budget.current_month_budget
  end
end
