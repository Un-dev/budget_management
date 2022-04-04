class CreateAccount < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :title
      t.float :assets
      t.boolean :main_account, default: false
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
