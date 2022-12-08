# bettercoach-assignment-ror

## System
1. Linux Ubuntu 20.04

## Ruby Version 
2. Ruby-3.1.2 

## Devise Authentication 
3. Registration 
```
curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "user1.test@example.com", "password": "password" } }' http://localhost:3000/users
```
![devise-registration](https://user-images.githubusercontent.com/94526737/206380115-caa27d3c-c9df-4053-840e-19aefc0d163b.png)

4. SignIn
```
curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "user1.test@example.com", "password": "password" } }' http://localhost:3000/users/sign_in
```
![devise-signin](https://user-images.githubusercontent.com/94526737/206380420-33ecf561-c447-4ae1-a099-a042e7c7cfd8.png)

5. SignOut 
```
DELETE -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMSIsInNjcCI6InVzZXIiLCJhdWQiOm51bGwsImlhdCI6MTY3MDQ4Mjg5OSwiZXhwIjoxNjcwNDg2NDk5LCJqdGkiOiI0NjM2YjUxZS1hZmQyLTRmY2UtYTNhMy1iNDczZGYyZWQ3NjQifQ.xIMtdnhINEyd8bIQRZW_7hZIvNnGKK0rWXqiuX6wcT0" -H "Content-Type: application/json" http://localhost:3000/users/sign_out
```
![devise-signout](https://user-images.githubusercontent.com/94526737/206380812-a74acfd3-2de7-4e1a-810f-70ed21abe564.png)

### GROUP

6. To Create a Group 
```
http://localhost:3000/groups  ||  POST 
```
````
Body : 
{
    "group" : {
        "name" : "Group Test",
        "description" : "Group of 10",
        "group_users_attributes" : [
            { "user_id" : 1},
            { "user_id" : 2},
            { "user_id" : 3},
            { "user_id" : 4},
            { "user_id" : 5},
            { "user_id" : 6},
            { "user_id" : 7},
            { "user_id" : 8},
            { "user_id" : 9},
            { "user_id" : 10}
        ] 
    }
}

Response : 
{
    "id": 2,
    "name": "Group Test",
    "description": "Group of 10",
    "created_by_id": 1,
    "created_at": "2022-12-08T07:08:17.206Z",
    "updated_at": "2022-12-08T07:08:17.206Z"
}
````

7. To List all the users of a Group: 
```
http://localhost:3000/groups  ||  GET
```
````
[
    {
        "id": 1,
        "name": "Group of 10 people",
        "description": "Seed data",
        "created_by_id": 1,
        "created_at": "2022-12-07T21:13:14.664Z",
        "updated_at": "2022-12-07T21:13:14.664Z"
    },
    {
        "id": 2,
        "name": "Group Test",
        "description": "Group of 10",
        "created_by_id": 1,
        "created_at": "2022-12-08T07:08:17.206Z",
        "updated_at": "2022-12-08T07:08:17.206Z"
    }
]
````

8. To Update Group Details like name / description 
```
http://localhost:3000/groups/2  || PATCH
```
````
Body: 
{
    "group" : {
        "name" : "Group Name 2"
    }
}

Response: 
true
````

9. To Update Group Members 
```
http://localhost:3000/groups/2/update_group_users  || PATCH
```
````
Body: 
{
    "add_member_ids" : [11],
    "removed_member_ids" : [10]
}

Response: 
{
    "message": "Update members of the Group Name 2"
}
````

10. To Delete a Group 
```
http://localhost:3000/groups/2  || DELETE
```
````
Response : 
{
    "id": 3,
    "name": "Group 3",
    "description": "Delete",
    "created_by_id": 1,
    "created_at": "2022-12-08T07:19:04.160Z",
    "updated_at": "2022-12-08T07:19:04.160Z"
}
````
### CATEGORY 

11. To Create a Categroy 
```
http://localhost:3000/categories  ||  POST
```
````
Body:
{
    "category" : {
        "name" : "Test Category"
    }
}

Response: 
{
    "id": 7,
    "name": "Test Category",
    "created_at": "2022-12-08T07:21:42.961Z",
    "updated_at": "2022-12-08T07:21:42.961Z"
}
````

12. To list all categories 
```
http://localhost:3000/categories
```
````
Response:
[
    {
        "id": 1,
        "name": "category",
        "created_at": "2022-12-07T21:13:14.513Z",
        "updated_at": "2022-12-07T21:13:14.513Z"
    },
    {
        "id": 2,
        "name": "category",
        "created_at": "2022-12-07T21:13:14.520Z",
        "updated_at": "2022-12-07T21:13:14.520Z"
    },
    {
        "id": 3,
        "name": "category",
        "created_at": "2022-12-07T21:13:14.526Z",
        "updated_at": "2022-12-07T21:13:14.526Z"
    },
    {
        "id": 4,
        "name": "category",
        "created_at": "2022-12-07T21:13:14.533Z",
        "updated_at": "2022-12-07T21:13:14.533Z"
    },
    {
        "id": 5,
        "name": "category",
        "created_at": "2022-12-07T21:13:14.539Z",
        "updated_at": "2022-12-07T21:13:14.539Z"
    },
    {
        "id": 6,
        "name": "category",
        "created_at": "2022-12-07T21:13:14.545Z",
        "updated_at": "2022-12-07T21:13:14.545Z"
    },
    {
        "id": 7,
        "name": "Test Category",
        "created_at": "2022-12-08T07:21:42.961Z",
        "updated_at": "2022-12-08T07:21:42.961Z"
    }
]
````

### Expenses 


13. To Create an Expense 
## *To create expense group_id | category_id | expense_payers is a Requirnment*
```
http://localhost:3000/expenses  ||  POST 
```
````
Body:
{
  "expense" : {
      "name": "Test Expense 3",
      "amount" : 10000,
      "group_id" : 1,
      "category_id" : 2,
      "expense_payers" : [
          {
              "id" : 1,
              "amount" : 3000
          },
          {
              "id" : 2,
              "amount" : 3000
          },
          {
              "id" : 3,
              "amount" : 2000
          },
          {
              "id" : 4,
              "amount" : 1500
          },
          {
              "id" : 5,
              "amount" : 500
          }
      ]
  }
}

Response : 
[
    {
        "id": 1,
        "amount": 3000
    },
    {
        "id": 2,
        "amount": 3000
    },
    {
        "id": 3,
        "amount": 2000
    },
    {
        "id": 4,
        "amount": 1500
    },
    {
        "id": 5,
        "amount": 500
    },
    {
        "id": 6,
        "amount": 0
    },
    {
        "id": 7,
        "amount": 0
    },
    {
        "id": 8,
        "amount": 0
    },
    {
        "id": 9,
        "amount": 0
    },
    {
        "id": 11,
        "amount": 0
    }
]
````

13. To show split Expense with Group details  with Current Conversion 

## EUR
```
http://localhost:3000/groups/2?convert_to=EUR
```
````
Response : 
{
    "group": {
        "id": 2,
        "name": "Group Name 2",
        "description": "Group of 10",
        "created_by_id": 1,
        "created_at": "2022-12-08T07:08:17.206Z",
        "updated_at": "2022-12-08T07:12:48.142Z"
    },
    "group_members": [
        {
            "email": "user1@example.com"
        },
        {
            "email": "user2@example.com"
        },
        {
            "email": "user3@example.com"
        },
        {
            "email": "user4@example.com"
        },
        {
            "email": "user5@example.com"
        },
        {
            "email": "user6@example.com"
        },
        {
            "email": "user7@example.com"
        },
        {
            "email": "user8@example.com"
        },
        {
            "email": "user9@example.com"
        },
        {
            "email": "user1.test@example.com"
        }
    ],
    "group_expenses": [
        {
            "name": "Test Expense 3 API",
            "created_by": "user1@example.com",
            "amount": 10000.0
        }
    ],
    "group_split_expenses": [
        {
            "payment": "user5@example.com has to pay user1@example.com : amount : EUR 181.8"
        },
        {
            "payment": "user5@example.com has to pay user2@example.com : amount : EUR 181.8"
        },
        {
            "payment": "user5@example.com has to pay user3@example.com : amount : EUR 90.9"
        },
        {
            "payment": "user5@example.com has to pay user4@example.com : amount : EUR 45.45"
        },
        {
            "payment": "user6@example.com has to pay user1@example.com : amount : EUR 363.6"
        },
        {
            "payment": "user6@example.com has to pay user2@example.com : amount : EUR 363.6"
        },
        {
            "payment": "user6@example.com has to pay user3@example.com : amount : EUR 181.8"
        },
        {
            "payment": "user6@example.com has to pay user4@example.com : amount : EUR 90.9"
        },
        {
            "payment": "user7@example.com has to pay user1@example.com : amount : EUR 363.6"
        },
        {
            "payment": "user7@example.com has to pay user2@example.com : amount : EUR 363.6"
        },
        {
            "payment": "user7@example.com has to pay user3@example.com : amount : EUR 181.8"
        },
        {
            "payment": "user7@example.com has to pay user4@example.com : amount : EUR 90.9"
        },
        {
            "payment": "user8@example.com has to pay user1@example.com : amount : EUR 363.6"
        },
        {
            "payment": "user8@example.com has to pay user2@example.com : amount : EUR 363.6"
        },
        {
            "payment": "user8@example.com has to pay user3@example.com : amount : EUR 181.8"
        },
        {
            "payment": "user8@example.com has to pay user4@example.com : amount : EUR 90.9"
        },
        {
            "payment": "user9@example.com has to pay user1@example.com : amount : EUR 363.6"
        },
        {
            "payment": "user9@example.com has to pay user2@example.com : amount : EUR 363.6"
        },
        {
            "payment": "user9@example.com has to pay user3@example.com : amount : EUR 181.8"
        },
        {
            "payment": "user9@example.com has to pay user4@example.com : amount : EUR 90.9"
        },
        {
            "payment": "user1.test@example.com has to pay user1@example.com : amount : EUR 363.6"
        },
        {
            "payment": "user1.test@example.com has to pay user2@example.com : amount : EUR 363.6"
        },
        {
            "payment": "user1.test@example.com has to pay user3@example.com : amount : EUR 181.8"
        },
        {
            "payment": "user1.test@example.com has to pay user4@example.com : amount : EUR 90.9"
        }
    ]
}
````
## INR
```
http://localhost:3000/groups/2?convert_to=INR
```
````
{
    "group": {
        "id": 2,
        "name": "Group Name 2",
        "description": "Group of 10",
        "created_by_id": 1,
        "created_at": "2022-12-08T07:08:17.206Z",
        "updated_at": "2022-12-08T07:12:48.142Z"
    },
    "group_members": [
        {
            "email": "user1@example.com"
        },
        {
            "email": "user2@example.com"
        },
        {
            "email": "user3@example.com"
        },
        {
            "email": "user4@example.com"
        },
        {
            "email": "user5@example.com"
        },
        {
            "email": "user6@example.com"
        },
        {
            "email": "user7@example.com"
        },
        {
            "email": "user8@example.com"
        },
        {
            "email": "user9@example.com"
        },
        {
            "email": "user1.test@example.com"
        }
    ],
    "group_expenses": [
        {
            "name": "Test Expense 3 API",
            "created_by": "user1@example.com",
            "amount": 10000.0
        }
    ],
    "group_split_expenses": [
        {
            "payment": "user5@example.com has to pay user1@example.com : amount : INR 15752.594401200002"
        },
        {
            "payment": "user5@example.com has to pay user2@example.com : amount : INR 15752.594401200002"
        },
        {
            "payment": "user5@example.com has to pay user3@example.com : amount : INR 7876.297200600001"
        },
        {
            "payment": "user5@example.com has to pay user4@example.com : amount : INR 3938.1486003000005"
        },
        {
            "payment": "user6@example.com has to pay user1@example.com : amount : INR 31505.188802400004"
        },
        {
            "payment": "user6@example.com has to pay user2@example.com : amount : INR 31505.188802400004"
        },
        {
            "payment": "user6@example.com has to pay user3@example.com : amount : INR 15752.594401200002"
        },
        {
            "payment": "user6@example.com has to pay user4@example.com : amount : INR 7876.297200600001"
        },
        {
            "payment": "user7@example.com has to pay user1@example.com : amount : INR 31505.188802400004"
        },
        {
            "payment": "user7@example.com has to pay user2@example.com : amount : INR 31505.188802400004"
        },
        {
            "payment": "user7@example.com has to pay user3@example.com : amount : INR 15752.594401200002"
        },
        {
            "payment": "user7@example.com has to pay user4@example.com : amount : INR 7876.297200600001"
        },
        {
            "payment": "user8@example.com has to pay user1@example.com : amount : INR 31505.188802400004"
        },
        {
            "payment": "user8@example.com has to pay user2@example.com : amount : INR 31505.188802400004"
        },
        {
            "payment": "user8@example.com has to pay user3@example.com : amount : INR 15752.594401200002"
        },
        {
            "payment": "user8@example.com has to pay user4@example.com : amount : INR 7876.297200600001"
        },
        {
            "payment": "user9@example.com has to pay user1@example.com : amount : INR 31505.188802400004"
        },
        {
            "payment": "user9@example.com has to pay user2@example.com : amount : INR 31505.188802400004"
        },
        {
            "payment": "user9@example.com has to pay user3@example.com : amount : INR 15752.594401200002"
        },
        {
            "payment": "user9@example.com has to pay user4@example.com : amount : INR 7876.297200600001"
        },
        {
            "payment": "user1.test@example.com has to pay user1@example.com : amount : INR 31505.188802400004"
        },
        {
            "payment": "user1.test@example.com has to pay user2@example.com : amount : INR 31505.188802400004"
        },
        {
            "payment": "user1.test@example.com has to pay user3@example.com : amount : INR 15752.594401200002"
        },
        {
            "payment": "user1.test@example.com has to pay user4@example.com : amount : INR 7876.297200600001"
        }
    ]
}
````
