class Transfer < ApplicationRecord
  belongs_to :from_account, class_name: 'Account'
  belongs_to :to_account, class_name: 'Account'

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :from_account_id, presence: true
  validates :to_account_id, presence: true
  validates_with TransferValidator
  before_save :update_assets

  def update_assets
    from_account.update_attribute(:balance, from_account.balance - amount)
    to_account.update_attribute(:balance, to_account.balance + amount)
  end
end
