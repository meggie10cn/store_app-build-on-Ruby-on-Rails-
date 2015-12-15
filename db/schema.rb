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

ActiveRecord::Schema.define(version: 20151123155715) do

  create_table "buyers", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "password",   limit: 255
    t.string   "squestion1", limit: 255
    t.string   "sanswer1",   limit: 255
    t.string   "squestion2", limit: 255
    t.string   "sanswer2",   limit: 255
    t.string   "squestion3", limit: 255
    t.string   "sanswer3",   limit: 255
    t.integer  "lockable",   limit: 4,   default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comics", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "publisher",  limit: 255
    t.integer  "issue",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "attachment", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "password",   limit: 255
    t.string   "squestion1", limit: 255
    t.string   "sanswer1",   limit: 255
    t.string   "squestion2", limit: 255
    t.string   "sanswer2",   limit: 255
    t.string   "squestion3", limit: 255
    t.string   "sanswer3",   limit: 255
    t.integer  "lockable",   limit: 4,   default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
