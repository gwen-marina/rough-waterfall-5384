# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_02_204647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customer_items", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "item_id"
    t.index ["customer_id"], name: "index_customer_items_on_customer_id"
    t.index ["item_id"], name: "index_customer_items_on_item_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.bigint "supermarket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supermarket_id"], name: "index_customers_on_supermarket_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "floor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_tickets", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "ticket_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "price"
  end

  create_table "supermarkets", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "subject"
    t.integer "age"
  end

  add_foreign_key "customer_items", "customers"
  add_foreign_key "customer_items", "items"
  add_foreign_key "customers", "supermarkets"
  add_foreign_key "employees", "departments"
end
