class CreateExpense < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.date :date
      t.string :title
      t.integer :amount
      t.references :category, index: true, foreign_key: true
      t.references :budget, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
