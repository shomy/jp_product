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

ActiveRecord::Schema.define(version: 2019_10_05_025359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "area1"
    t.string "area2"
    t.string "area3"
    t.string "area4"
    t.string "area5"
    t.string "area6"
    t.string "area7"
    t.string "area8"
    t.string "area9"
    t.string "area10"
    t.bigint "ginfo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ginfo_id"], name: "index_areas_on_ginfo_id"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_entries_on_room_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "ginfos", force: :cascade do |t|
    t.integer "age"
    t.string "sex"
    t.string "tel_number"
    t.string "face_picture"
    t.text "hitokoto_shoukai"
    t.text "shoukaibun"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ginfos_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "japanese"
    t.string "integer"
    t.string "engilsh"
    t.string "Chinese"
    t.integer "Spanish"
    t.text "sonota_language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scenes", force: :cascade do |t|
    t.string "scene_picture1"
    t.string "scene_picture2"
    t.string "scene_picture3"
    t.string "scene_picture4"
    t.string "scene_picture5"
    t.string "scene_picture6"
    t.bigint "ginfo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ginfo_id"], name: "index_scenes_on_ginfo_id"
  end

  create_table "treats", force: :cascade do |t|
    t.integer "treat_f"
    t.bigint "ginfo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ginfo_id"], name: "index_treats_on_ginfo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "areas", "ginfos"
  add_foreign_key "entries", "rooms"
  add_foreign_key "entries", "users"
  add_foreign_key "ginfos", "users"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "scenes", "ginfos"
  add_foreign_key "treats", "ginfos"
end
