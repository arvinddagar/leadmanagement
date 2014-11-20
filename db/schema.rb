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

ActiveRecord::Schema.define(version: 20141120101037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_updates", force: true do |t|
    t.string   "business"
    t.string   "contact_person"
    t.string   "number"
    t.string   "designation"
    t.string   "status"
    t.text     "summary"
    t.string   "address"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "category_id"
  end

  create_table "dureports", force: true do |t|
    t.string   "business"
    t.string   "contact_person"
    t.string   "number"
    t.string   "designation"
    t.string   "status"
    t.text     "summary"
    t.string   "address"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lead_statuses", force: true do |t|
    t.string   "state"
    t.integer  "user_id"
    t.integer  "daily_update_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment"
  end

  add_index "lead_statuses", ["daily_update_id"], name: "index_lead_statuses_on_daily_update_id", using: :btree
  add_index "lead_statuses", ["user_id"], name: "index_lead_statuses_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.boolean  "active"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
