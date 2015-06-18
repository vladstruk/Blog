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

ActiveRecord::Schema.define(version: 20150618103927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_categories", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "article_categories", ["article_id", "category_id"], name: "index_article_categories_on_article_id_and_category_id", unique: true, using: :btree
  add_index "article_categories", ["article_id"], name: "index_article_categories_on_article_id", using: :btree
  add_index "article_categories", ["category_id"], name: "index_article_categories_on_category_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "payment_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subscription_id", null: false
    t.integer  "card_number"
    t.integer  "cvv"
    t.date     "expiry_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "subscribed_at",   null: false
  end

  add_index "payment_profiles", ["user_id", "subscription_id"], name: "index_payment_profiles_on_user_id_and_subscription_id", unique: true, using: :btree
  add_index "payment_profiles", ["user_id"], name: "index_payment_profiles_on_user_id", unique: true, using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.string   "name"
    t.integer  "period"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subscriptions", ["name"], name: "index_subscriptions_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.string   "activation_code"
    t.boolean  "active"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "article_categories", "articles"
  add_foreign_key "article_categories", "categories"
  add_foreign_key "articles", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "payment_profiles", "subscriptions"
  add_foreign_key "payment_profiles", "users"
end
