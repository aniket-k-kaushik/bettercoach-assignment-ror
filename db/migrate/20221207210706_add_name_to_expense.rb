class AddNameToExpense < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :name, :string
  end
end
