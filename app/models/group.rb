class Group < ApplicationRecord

  belongs_to :created_by, class_name: "User"

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :expenses

  validates :name, presence: true, uniqueness: true
  validates :group_users, length: { minimum: 1, message: 'should have atleast one associated user' }

  accepts_nested_attributes_for :group_users

  def group_members
    self.group_users.includes(:user).map do |group_user| 
      { email: group_user.user.email}
    end 
  end 

  def group_expenses
    self.expenses.includes(:created_by).map do |expense|
      {
        name: expense.name, 
        created_by: expense.created_by.email,
        amount: expense.amount.to_f
      }
    end 
  end 

  def split_calculation 
    split_calculation_array = []
    group_expense_splits = ExpenseSplit.includes(:giver_user, :receiver_user).where(expense_id: [self.expenses.ids])
    group_expense_splits.each do |expense|
      gave_temp_array = []
      paid_temp_array = []
      group_expense_splits.each do |expense_second|
        if (expense_second.giver_user_id == expense.giver_user_id && expense_second.receiver_user_id == expense.receiver_user_id && expense_second.status == "gave")
          gave_temp_array.push(expense_second.amount.to_f)
          # group_expense_splits.delete(expense_second)
        end
        if (expense_second.giver_user_id == expense.receiver_user_id && expense_second.receiver_user_id == expense.giver_user_id && expense_second.status == "paid")
          paid_temp_array.push(expense_second.amount.to_f)
          # group_expense_splits.delete(expense_second)
        end
      end
      total_amount_gave = gave_temp_array.sum
      total_amount_paid = paid_temp_array.sum
      sting = if total_amount_gave > total_amount_paid
        { payment: "#{expense.receiver_user.email} has to pay #{expense.giver_user.email} : amount : #{total_amount_gave - total_amount_paid}" }
      else 
        { payment: "#{expense.giver_user.email} has to pay #{expense.receiver_user.email} : amount : #{total_amount_paid - total_amount_gave}" }
      end 
      split_calculation_array.push(sting)
    end 
    return split_calculation_array
  end 
end
