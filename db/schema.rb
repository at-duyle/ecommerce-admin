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

ActiveRecord::Schema.define(version: 20170921070546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "encrypted_password", default: "", null: false
    t.string "email"
    t.string "name"
    t.integer "gender"
    t.integer "role"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.bigint "manager_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "available", default: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["manager_id"], name: "index_admins_on_manager_id"
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["shop_id"], name: "index_admins_on_shop_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.json "cart"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "delivery_orders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.float "total_price"
    t.string "name"
    t.string "city"
    t.string "district"
    t.string "ward"
    t.string "address"
    t.string "phone"
    t.index ["user_id"], name: "index_delivery_orders_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.text "url"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "producer"
    t.float "price"
    t.integer "quantity"
    t.text "description"
    t.string "categorical_type"
    t.bigint "categorical_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.boolean "available", default: true
    t.index ["categorical_type", "categorical_id"], name: "index_products_on_categorical_type_and_categorical_id"
    t.index ["shop_id"], name: "index_products_on_shop_id"
    t.index ["slug"], name: "index_products_on_slug", unique: true
  end

  create_table "products_delivery_orders", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "delivery_order_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_order_id"], name: "index_products_delivery_orders_on_delivery_order_id"
    t.index ["product_id"], name: "index_products_delivery_orders_on_product_id"
  end

  create_table "products_purchase_orders", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "purchase_order_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_purchase_orders_on_product_id"
    t.index ["purchase_order_id"], name: "index_products_purchase_orders_on_purchase_order_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.string "supplier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "available", default: true
  end

  create_table "requests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "shop_name"
    t.string "shop_address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.string "logo"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "available", default: true
    t.string "slug"
    t.index ["slug"], name: "index_shops_on_slug", unique: true
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
    t.index ["slug"], name: "index_sub_categories_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "name"
    t.integer "gender"
    t.string "address"
    t.text "description"
    t.string "auth_token"
    t.datetime "confirm_send_at"
    t.string "confirm_token"
    t.datetime "confirm_at"
    t.datetime "reset_send_at"
    t.string "reset_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "available", default: true
    t.string "slug"
    t.string "city"
    t.string "district"
    t.string "ward"
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "admins", "shops"
  add_foreign_key "carts", "users"
  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "delivery_orders", "users"
  add_foreign_key "images", "products"
  add_foreign_key "products", "shops"
  add_foreign_key "products_delivery_orders", "delivery_orders"
  add_foreign_key "products_delivery_orders", "products"
  add_foreign_key "products_purchase_orders", "products"
  add_foreign_key "products_purchase_orders", "purchase_orders"
  add_foreign_key "sub_categories", "categories"
end
