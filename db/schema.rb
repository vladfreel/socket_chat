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

ActiveRecord::Schema.define(version: 20180524105833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_rooms", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chat_rooms_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "private_chat_room_id"
    t.bigint "owner_id"
    t.bigint "member_id"
    t.index ["member_id"], name: "index_memberships_on_member_id"
    t.index ["owner_id"], name: "index_memberships_on_owner_id"
    t.index ["private_chat_room_id"], name: "index_memberships_on_private_chat_room_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "multi_user_memberships", force: :cascade do |t|
    t.bigint "multi_user_private_chat_room_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["multi_user_private_chat_room_id"], name: "index_multi_user_memberships_on_multi_user_private_chat_room_id"
    t.index ["user_id"], name: "index_multi_user_memberships_on_user_id"
  end

  create_table "multi_user_messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "multi_user_private_chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["multi_user_private_chat_room_id"], name: "index_multi_user_messages_on_multi_user_private_chat_room_id"
    t.index ["user_id"], name: "index_multi_user_messages_on_user_id"
  end

  create_table "multi_user_private_chat_rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_multi_user_private_chat_rooms_on_user_id"
  end

  create_table "private_chat_rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "private_messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "private_chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["private_chat_room_id"], name: "index_private_messages_on_private_chat_room_id"
    t.index ["user_id"], name: "index_private_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "first_name"
    t.string "last_name"
    t.string "display_name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chat_rooms", "users"
  add_foreign_key "memberships", "private_chat_rooms"
  add_foreign_key "memberships", "users", column: "member_id"
  add_foreign_key "memberships", "users", column: "owner_id"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "multi_user_memberships", "multi_user_private_chat_rooms"
  add_foreign_key "multi_user_memberships", "users"
  add_foreign_key "multi_user_messages", "multi_user_private_chat_rooms"
  add_foreign_key "multi_user_messages", "users"
  add_foreign_key "multi_user_private_chat_rooms", "users"
  add_foreign_key "private_messages", "private_chat_rooms"
  add_foreign_key "private_messages", "users"
end
