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

ActiveRecord::Schema.define(version: 20130911120748) do

  create_table "runs", force: true do |t|
    t.integer  "session_id"
    t.string   "extid"
    t.string   "state"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "runs", ["session_id"], name: "index_runs_on_session_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "uuid"
    t.string   "remoteip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
