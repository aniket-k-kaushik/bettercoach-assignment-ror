class Expense < ApplicationRecord

  belongs_to :created_by, class_name: "User"
  belongs_to :group
  belongs_to :category

  has_many :expense_payers
  has_many :expense_splits

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }

  ## Split logic claculation start 
  def self.expense_calculation(expense)
    new_expense = Expense.create( 
      name: expense["name"],
      amount: expense["amount"], 
      group_id: expense["group_id"],
      category_id: expense["category_id"], 
      created_by_id: expense["created_by_id"]
      )

    group = Group.includes(:group_users).find(expense["group_id"])
    group_users = group.group_users

    equal_split_amount = expense["amount"] / group_users.count

    expense["expense_payers"].each do |expense_payer|
      ExpensePayer.create(
        expense_id: new_expense.id,
        paid_by_id: expense_payer["id"],
        amount: expense_payer["amount"])
    end 

    expense_payers_ids = []
    expense["expense_payers"].map do |expense_payer|
      expense_payers_ids.push(expense_payer["id"])
    end 
    
    group_users.each do |group_user|
      unless expense_payers_ids.include?(group_user.user_id)
        expense["expense_payers"].push({"id"=>group_user.user_id, "amount"=>0})
      end 
    end 

    giver_expense_payer = []
    total_extra_amount_paid_by_payers = []
    expense["expense_payers"].map do |expense_payer|
      if expense_payer["amount"] > equal_split_amount
        giver_expense_payer.push({
          "id"=> expense_payer["id"], 
          "extra_amount"=> expense_payer["amount"] - equal_split_amount
        })
        total_extra_amount_paid_by_payers.push(expense_payer["amount"] - equal_split_amount)
      end 
    end  

    total_extra_amount_paid_by_payers = total_extra_amount_paid_by_payers.sum

    giver_expense_payer_percentage = []
    giver_expense_payer.map do |expense_payer|
      percentage = ((expense_payer["extra_amount"] / total_extra_amount_paid_by_payers.to_f) * 100.00).round(2)
      giver_expense_payer_percentage.push({ 
        "id" => expense_payer["id"],
        "percentage" => percentage
      })
    end
    
    expense["expense_payers"].each do |expense_payer|
      if expense_payer["amount"] < equal_split_amount
        amount_to_be_paid = equal_split_amount - expense_payer["amount"]
        giver_expense_payer_percentage.each do |percentage|
          ExpenseSplit.create!(
            expense_id: new_expense.id,
            giver_user_id: percentage["id"], 
            receiver_user_id: expense_payer["id"],
            amount: ((percentage["percentage"] * amount_to_be_paid) / 100.00).round(2),
            status: 0
          )
        end 
      end 
    end 
  end 
  ## Split logic claculation End

end
