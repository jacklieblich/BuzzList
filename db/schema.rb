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

ActiveRecord::Schema.define(version: 20160821055305) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "clips", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "episode_id"
    t.string   "title"
    t.string   "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.integer  "episode_number"
    t.string   "title"
    t.text     "summary"
    t.integer  "season_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "buzzlisted"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "likable_id"
    t.string   "likable_type"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "likes", ["likable_type", "likable_id"], name: "index_likes_on_likable_type_and_likable_id"
  add_index "likes", ["user_id", "likable_id", "likable_type"], name: "index_likes_on_user_id_and_likable_id_and_likable_type", unique: true

  create_table "list_episodes", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "episode_id"
    t.integer  "ranking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "list_episodes", ["episode_id", "list_id"], name: "index_list_episodes_on_episode_id_and_list_id", unique: true

  create_table "lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.integer  "episode_id"
    t.string   "character"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "show_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "rating"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "seasons", force: :cascade do |t|
    t.integer  "season_number"
    t.integer  "show_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "shows", force: :cascade do |t|
    t.string   "title"
    t.string   "poster"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
