class CreateExpensePayers < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_payers do |t|
      t.integer :amount, null: false
      t.references :paid_by, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
