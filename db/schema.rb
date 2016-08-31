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

ActiveRecord::Schema.define(version: 20160831200747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.integer  "user_id"
    t.index ["latitude"], name: "index_candidates_on_latitude", using: :btree
    t.index ["longitude"], name: "index_candidates_on_longitude", using: :btree
    t.index ["user_id"], name: "index_candidates_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.text     "username"
    t.text     "provider",    null: false
    t.text     "provider_id", null: false
    t.text     "name"
    t.text     "location"
    t.text     "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["provider", "provider_id"], name: "index_users_on_provider_and_provider_id", unique: true, using: :btree
    t.index ["provider"], name: "index_users_on_provider", using: :btree
    t.index ["provider_id"], name: "index_users_on_provider_id", using: :btree
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

end
