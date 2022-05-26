class Account < ApplicationRecord
  belongs_to :user
  has_many :expenses
  has_many :sent_transfers,
           class_name: 'Transfer',
           foreign_key: 'from_account_id'
  has_many :received_transfers,
           class_name: 'Transfer',
           foreign_key: 'to_account_id'
end
