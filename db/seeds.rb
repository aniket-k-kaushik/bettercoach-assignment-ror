# User Start 

@emails = [
  "user1@example.com",
  "user2@example.com",
  "user3@example.com",
  "user4@example.com",
  "user5@example.com",
  "user6@example.com",
  "user7@example.com",
  "user8@example.com",
  "user9@example.com",
  "user10@example.com",
]

@emails.each do |eamil|
  User.create!(email: eamil, password: "password")
end
puts "Users created successfully"

# User End


# Category Start

@categories = [
  "food",
  "car",
  "trip",
  "party",
  "club0",
  "other"
]
@categories.each do |category|
  Category.create!(name: "category")
end 
puts "Categories created successfully"

# Category End

# Group Start 

Group.create!(
  name: "Group of 10 people", 
  description: "Seed data",
  group_users_attributes: [
    {user_id: 1},
    {user_id: 2},
    {user_id: 3},
    {user_id: 4},
    {user_id: 5},
    {user_id: 6},
    {user_id: 7},
    {user_id: 8},
    {user_id: 9},
    {user_id: 10},
  ],
  created_by_id: 1
)

puts "Group created successfully"

# Group End 

# Expense Start 

# Expense.expense_calculation({
#   "expense" : {
#       "amount" : 10000,
#       "group_id" : 1,
#       "category_id" : 2,
#       "expense_payers" : [
#           {
#               "id" : 1,
#               "amount" : 3000
#           },
#           {
#               "id" : 2,
#               "amount" : 3000
#           },
#           {
#               "id" : 3,
#               "amount" : 2000
#           },
#           {
#               "id" : 4,
#               "amount" : 1500
#           },
#           {
#               "id" : 5,
#               "amount" : 500
#           }
#       ]
#   }
# })

# Expense End 