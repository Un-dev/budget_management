class Budget < ApplicationRecord
  has_many :expenses
  belongs_to :category
  belongs_to :user

  def month_label
    starts_at.strftime('%B %Y')
  end

  def has_next?; end

  def has_previous?; end

  def self.current_month_budget
    find_by(starts_at: Date.current.beginning_of_month, monthly: true)
  end

  def self.next(budget)
    where('starts_at > ?', budget.starts_at).order(:starts_at).first || budget
  end

  def self.previous(budget)
    where('starts_at < ?', budget.starts_at).order(starts_at: :desc).first ||
      budget
  end
end
