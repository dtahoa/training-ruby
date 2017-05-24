class CreateModelTable < ActiveRecord::Migration[5.0]
  def self.up
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

  def self.down

  end
end
