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

ActiveRecord::Schema.define(version: 20170524040930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "channels", primary_key: "guid", id: :uuid, default: nil, force: :cascade do |t|
    t.string   "name",        limit: 50
    t.uuid     "owner"
    t.uuid     "org_id"
    t.boolean  "is_private"
    t.text     "state"
    t.text     "status"
    t.jsonb    "shared_with"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee", id: false, force: :cascade do |t|
    t.string "id", limit: 30
  end

  create_table "organizations", primary_key: "guid", id: :uuid, default: nil, force: :cascade do |t|
    t.string   "name",                  limit: 100
    t.binary   "logo"
    t.string   "primary_contact_email", limit: 255
    t.boolean  "status"
    t.string   "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", primary_key: "guid", id: :uuid, default: nil, force: :cascade do |t|
    t.string   "email",                 limit: 50
    t.string   "first_name",            limit: 50
    t.string   "last_name",             limit: 50
    t.string   "password_hash",         limit: 128
    t.string   "password_salt",         limit: 128
    t.uuid     "org_id"
    t.jsonb    "feature_access"
    t.text     "access_token"
    t.boolean  "should_reset_password"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "channels", "organizations", column: "org_id", primary_key: "guid", name: "channels_org_id_fkey"
  add_foreign_key "users", "organizations", column: "org_id", primary_key: "guid", name: "users_org_id_fkey"
end
