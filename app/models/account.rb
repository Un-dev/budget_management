class Account < ApplicationRecord
  belongs_to :user
  has_many :expenses

  def transfer(receiver_account, amount)
    self.assets -= amount
    self.save
    receiver_account.assets += amount
    receiver_account.save
  end
end
