class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :budget
  belongs_to :account

  after_create :update_account_on_create
  before_update :update_account_on_update

  def update_account_on_create
    new_assets = account.assets + amount
    account.update_attribute(:assets, new_assets)
  end

  def update_account_on_update
    new_assets = account.assets + (self.amount - amount_was)
    account.update_attribute(:assets, new_assets)
  end

  def to_html
    res = ''
    if amount < 0
      res = "<p class='font-semibold'>#{amount}€</p>"
    else
      res = "<p class='text-green-400 font-semibold'>+#{amount}€</p>"
    end
    res.html_safe
  end
end
