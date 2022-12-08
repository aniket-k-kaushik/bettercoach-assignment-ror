class Expense < ApplicationRecord

  belongs_to :created_by, class_name: "User"
  belongs_to :group
  belongs_to :category

  has_many :expense_payers
  has_many :expense_splits

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }

end
