class AddExpenseToExpensePayer < ActiveRecord::Migration[7.0]
  def change
    add_reference :expense_payers, :expense, foreign_key: true, null: false
  end
end
