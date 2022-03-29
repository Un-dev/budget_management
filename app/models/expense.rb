class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :budget
  belongs_to :account

  after_create :update_account_on_create
  after_update :update_account_on_update

  def update_account_on_create
    if is_income
      new_assets = account.assets + amount
    else
      new_assets = account.assets - amount
    end
    account.update_attribute(:assets, new_assets)
  end

  def update_account_on_update; end
end
