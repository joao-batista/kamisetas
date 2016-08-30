# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160828201126) do

  create_table "categories", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "items", force: :cascade do |t|
    t.decimal  "price"
    t.integer  "quantity"
    t.decimal  "discount"
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["order_id"], name: "index_items_on_order_id"
  add_index "items", ["product_id"], name: "index_items_on_product_id"

  create_table "kind_payments", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "request_date"
    t.date     "disptch_date"
    t.date     "delivery_date"
    t.decimal  "freight"
    t.integer  "user_id"
    t.integer  "status_order_id"
    t.integer  "payment_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "orders", ["payment_id"], name: "index_orders_on_payment_id"
  add_index "orders", ["status_order_id"], name: "index_orders_on_status_order_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "payments", force: :cascade do |t|
    t.decimal  "value"
    t.integer  "status_payment_id"
    t.integer  "kind_payment_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "payments", ["kind_payment_id"], name: "index_payments_on_kind_payment_id"
  add_index "payments", ["status_payment_id"], name: "index_payments_on_status_payment_id"

  create_table "product_sizes", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_sizes", ["product_id"], name: "index_product_sizes_on_product_id"
  add_index "product_sizes", ["size_id"], name: "index_product_sizes_on_size_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.integer  "quantity"
    t.string   "picture"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"

  create_table "sizes", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "status_orders", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "status_payments", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "location"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "confirmed_at"
    t.string   "confirmation_token"
  end

end
