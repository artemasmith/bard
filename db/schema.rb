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

ActiveRecord::Schema.define(version: 20140211115625) do

  create_table "barcodes", force: true do |t|
    t.string   "number"
    t.integer  "id_ware"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cat_props", force: true do |t|
    t.integer  "id_cat"
    t.integer  "id_prop"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.integer  "id_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characteristics", force: true do |t|
    t.integer  "id_ware"
    t.integer  "id_prop"
    t.integer  "id_val"
    t.integer  "id_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_codes", force: true do |t|
    t.integer  "id_client"
    t.integer  "id_barcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "title"
    t.text     "specs"
    t.string   "login"
    t.string   "pass"
    t.boolean  "blocked"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_wares", force: true do |t|
    t.integer "id_parent"
    t.integer "ware_id"
  end

  create_table "operation_logs", force: true do |t|
    t.integer  "id_type"
    t.string   "event"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operation_types", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.string   "title"
    t.integer  "id_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "title"
    t.string   "permissions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unvalidated_wares", force: true do |t|
    t.string   "barode"
    t.string   "comment"
    t.integer  "id_client"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_groups", force: true do |t|
    t.integer  "id_group"
    t.integer  "id_user"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "type"
    t.integer  "id_role"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "values", force: true do |t|
    t.integer  "id_prop"
    t.string   "value"
    t.integer  "id_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wares", force: true do |t|
    t.string   "title"
    t.integer  "id_parent"
    t.text     "specs"
    t.integer  "id_cat"
    t.integer  "type"
    t.integer  "id_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
