class Account < ApplicationRecord
  belongs_to :user
  has_many :expenses

  def transfer(receiver_account, amount)
    self.balance -= amount
    self.save
    receiver_account.balance += amount
    receiver_account.save
  end
end
