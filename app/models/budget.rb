class Budget < ApplicationRecord
  has_many :expenses
  def self.current_month_budget
    find_by(starts_at: Date.current.beginning_of_month, monthly: true)
  end

  def month_label
    starts_at.strftime("%B %Y")
  end

  def self.next(id)
    budget = find(id)

    where("starts_at > ?", budget.starts_at).order(:starts_at).first || budget
  end
  
  def self.previous(id)
    budget = find(id)
    where("starts_at < ?", budget.starts_at).order(:starts_at).first || budget
  end
end
