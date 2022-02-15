class Budget < ApplicationRecord

  def current_month_budget

    Budget.find_by(starts_at: Date.current.beginning_of_month, monthly: true)
  end
end
