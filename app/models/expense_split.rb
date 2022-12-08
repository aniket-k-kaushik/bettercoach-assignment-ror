class ExpenseSplit < ApplicationRecord

  belongs_to :expense
  belongs_to :giver_user, class_name: "User"
  belongs_to :receiver_user, class_name: "User"

  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }

  enum status: [:gave, :paid]

end
