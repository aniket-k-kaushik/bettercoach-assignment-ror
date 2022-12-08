class CreateExpenseSplits < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_splits do |t|
      t.integer :amount, null: :false
      t.references :expense, null: false, foreign_key: true
      t.references :giver_user, null: false, foreign_key: { to_table: :users }
      t.references :receiver_user, null: false, foreign_key: { to_table: :users }
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
