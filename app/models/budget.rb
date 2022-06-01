class Budget < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :expenses, through: :user

  validates :target_amount, presence: true, numericality: { greater_than: 0 }

  # TODO: make it impossible to have more than one budget per category per user
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
