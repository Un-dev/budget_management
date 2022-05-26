class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :accounts
  has_many :budgets
  has_many :expenses, through: :accounts
  has_many :sent_transfers,
           class_name: 'Transfer',
           foreign_key: 'from_account_id'

  def total_balance
    accounts.sum(:balance)
  end

  def transfers
    accounts.includes([:sent_transfers]).map { |account| account.sent_transfers }.flatten
  end
end
