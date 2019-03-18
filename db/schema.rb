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

ActiveRecord::Schema.define(version: 2019_03_06_005950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "zip_code"
    t.string "neighborhood"
    t.string "street_address"
    t.string "number"
    t.string "complement"
    t.integer "addressable_id"
    t.string "addressable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "business_users", force: :cascade do |t|
    t.bigint "business_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_business_users_on_business_id"
    t.index ["user_id"], name: "index_business_users_on_user_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_non_profits", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "non_profit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_non_profits_on_category_id"
    t.index ["non_profit_id"], name: "index_category_non_profits_on_non_profit_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "continents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coundies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coundy_cities", force: :cascade do |t|
    t.bigint "city_id"
    t.bigint "coundy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_coundy_cities_on_city_id"
    t.index ["coundy_id"], name: "index_coundy_cities_on_coundy_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "continent_id"
    t.index ["continent_id"], name: "index_countries_on_continent_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.float "discount", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "businesses_id"
    t.index ["businesses_id"], name: "index_coupons_on_businesses_id"
  end

  create_table "non_profits", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subscriptions_id"
    t.index ["subscriptions_id"], name: "index_non_profits_on_subscriptions_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "business_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coupons_id"
    t.index ["business_id"], name: "index_orders_on_business_id"
    t.index ["coupons_id"], name: "index_orders_on_coupons_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id"
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "plan_code"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "coupons_id"
    t.index ["coupons_id"], name: "index_subscriptions_on_coupons_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subscriptions_id"
    t.index ["subscriptions_id"], name: "index_transactions_on_subscriptions_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "email_confirmed", default: false
    t.string "provider", default: "email"
    t.string "token"
    t.string "password_reset_token"
    t.string "password_digest"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "business_users", "businesses"
  add_foreign_key "business_users", "users"
  add_foreign_key "category_non_profits", "categories"
  add_foreign_key "category_non_profits", "non_profits"
  add_foreign_key "coundy_cities", "cities"
  add_foreign_key "coundy_cities", "coundies"
  add_foreign_key "countries", "continents"
  add_foreign_key "coupons", "businesses", column: "businesses_id"
  add_foreign_key "non_profits", "subscriptions", column: "subscriptions_id"
  add_foreign_key "orders", "businesses"
  add_foreign_key "orders", "coupons", column: "coupons_id"
  add_foreign_key "orders", "users"
  add_foreign_key "states", "countries"
  add_foreign_key "subscriptions", "coupons", column: "coupons_id"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "transactions", "subscriptions", column: "subscriptions_id"
end
