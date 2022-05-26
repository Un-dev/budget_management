class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :account

  after_create :update_account_on_create
  before_update :update_account_on_update
  before_destroy :update_account_on_destroy

  def update_account_on_destroy
    account.update_attribute(:balance, account.balance - amount)
  end

  def update_account_on_create
    new_balance = account.balance + amount
    account.update_attribute(:balance, new_balance)
  end

  def update_account_on_update
    new_balance = account.balance + (self.amount - amount_was)
    account.update_attribute(:balance, new_balance)
  end
end
