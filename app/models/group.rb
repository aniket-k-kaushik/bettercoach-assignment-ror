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

end
