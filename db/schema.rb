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

ActiveRecord::Schema.define(version: 2019_03_26_161457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "zip_code"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "country", default: "USA"
    t.integer "type_cd"
    t.integer "addressable_id"
    t.string "addressable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_id", "addressable_type"], name: "index_addresses_on_addressable_id_and_addressable_type"
  end

  create_table "non_profits", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "badge_file_name"
    t.string "badge_content_type"
    t.integer "badge_file_size"
    t.datetime "badge_updated_at"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_non_profits_on_owner_id"
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
    t.string "customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "non_profit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["non_profit_id"], name: "index_wishlists_on_non_profit_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

end
