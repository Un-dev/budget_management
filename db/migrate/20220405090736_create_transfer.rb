class CreateTransfer < ActiveRecord::Migration[6.1]
  def change
    create_table :transfers do |t|
      t.datetime :date
      t.references :from_account,
                   index: true,
                   foreign_key: {
                     to_table: :accounts,
                   }
      t.references :to_account,
                   index: true,
                   foreign_key: {
                     to_table: :accounts,
                   }
      t.float :amount
      t.timestamps
    end
  end
end
