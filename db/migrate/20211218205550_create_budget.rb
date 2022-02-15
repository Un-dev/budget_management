class CreateBudget < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.date :starts_at
      t.date :ends_at
      t.boolean :monthly
      
      t.timestamps
    end
  end
end
