# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_07_210706) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expense_payers", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.bigint "paid_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "expense_id", null: false
    t.index ["expense_id"], name: "index_expense_payers_on_expense_id"
    t.index ["paid_by_id"], name: "index_expense_payers_on_paid_by_id"
  end

  create_table "expense_splits", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, default: "0.0"
    t.bigint "expense_id", null: false
    t.bigint "giver_user_id", null: false
    t.bigint "receiver_user_id", null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_expense_splits_on_expense_id"
    t.index ["giver_user_id"], name: "index_expense_splits_on_giver_user_id"
    t.index ["receiver_user_id"], name: "index_expense_splits_on_receiver_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, default: "0.0"
    t.bigint "group_id", null: false
    t.bigint "created_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.string "name"
    t.index ["category_id"], name: "index_expenses_on_category_id"
    t.index ["created_by_id"], name: "index_expenses_on_created_by_id"
    t.index ["group_id"], name: "index_expenses_on_group_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "created_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_groups_on_created_by_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "expense_payers", "expenses"
  add_foreign_key "expense_payers", "users", column: "paid_by_id"
  add_foreign_key "expense_splits", "expenses"
  add_foreign_key "expense_splits", "users", column: "giver_user_id"
  add_foreign_key "expense_splits", "users", column: "receiver_user_id"
  add_foreign_key "expenses", "categories"
  add_foreign_key "expenses", "groups"
  add_foreign_key "expenses", "users", column: "created_by_id"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "groups", "users", column: "created_by_id"
end
