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

ActiveRecord::Schema.define(version: 20140104110358) do

  create_table "group_members", force: true do |t|
    t.string   "name"
    t.boolean  "administrator"
    t.string   "fbid"
    t.string   "gender"
    t.string   "link"
    t.string   "username"
    t.datetime "updated_time"
    t.integer  "group_id"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "my_friends", force: true do |t|
    t.string   "fbid"
    t.string   "first_name"
    t.string   "name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "locale"
    t.string   "username"
    t.string   "picture_url"
    t.integer  "user_id"
    t.integer  "total_friend", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "my_groups", force: true do |t|
    t.string   "name"
    t.integer  "unread"
    t.integer  "bookmark_order"
    t.string   "gid"
    t.integer  "user_id"
    t.string   "icon"
    t.string   "email"
    t.datetime "updated_time"
    t.integer  "total_member"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "fbid"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "link"
    t.string   "username"
    t.string   "birthday"
    t.string   "work"
    t.text     "education"
    t.string   "gender"
    t.string   "locale"
    t.datetime "update_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "email"
    t.string   "image"
    t.string   "fburl"
    t.string   "locations"
    t.string   "fbid"
    t.string   "username"
    t.string   "gender"
    t.string   "timezone"
    t.string   "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "employee_info"
    t.text     "education_history"
  end

end
