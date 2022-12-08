class ExpensePayer < ApplicationRecord

  belongs_to :expense
  belongs_to :paid_by, class_name: "User"

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }

end
