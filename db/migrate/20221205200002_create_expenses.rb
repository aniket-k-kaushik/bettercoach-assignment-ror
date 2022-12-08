class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.integer :amount
      t.references :group, null: false, foreign_key: true
      t.references :created_by, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
