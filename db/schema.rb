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

ActiveRecord::Schema.define(version: 20140530102827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barcodes", force: true do |t|
    t.string   "number"
    t.integer  "ware_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.integer  "id_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_client_shops", force: true do |t|
    t.integer "category_id"
    t.integer "client_shop_id"
  end

  create_table "category_properties", force: true do |t|
    t.integer  "category_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characteristics", force: true do |t|
    t.integer  "ware_id"
    t.integer  "property_id"
    t.integer  "value_id"
    t.integer  "id_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_codes", force: true do |t|
    t.integer  "client_id"
    t.integer  "barcode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_shops", force: true do |t|
    t.string   "ip"
    t.integer  "out_id"
    t.integer  "client_id"
    t.string   "auth_token"
    t.datetime "token_expire"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "client_shops", ["auth_token"], name: "index_client_shops_on_auth_token", using: :btree

  create_table "operation_logs", force: true do |t|
    t.integer  "type_id"
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
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "unvalidated_wares", force: true do |t|
    t.string   "barode"
    t.string   "comment"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_groups", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
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
    t.integer  "user_type"
    t.integer  "id_role"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "login"
    t.text     "specs"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "values", force: true do |t|
    t.integer  "property_id"
    t.string   "content"
    t.integer  "id_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wares", force: true do |t|
    t.string   "title"
    t.integer  "parent_id"
    t.text     "specs"
    t.integer  "category_id"
    t.integer  "ware_type"
    t.integer  "id_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
