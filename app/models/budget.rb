class Budget < ApplicationRecord
  has_many :expenses
  def self.current_month_budget
    find_by(starts_at: Date.current.beginning_of_month, monthly: true)
  end
end
