class ChangeAmountColumnToDecimal < ActiveRecord::Migration[7.0]
  def change
    change_column :expense_payers, :amount, :decimal, default: 0.00, precision: 10, scale: 2
    change_column :expense_splits, :amount, :decimal, default: 0.00, precision: 10, scale: 2
    change_column :expenses, :amount, :decimal, default: 0.00, precision: 10, scale: 2
  end
end
