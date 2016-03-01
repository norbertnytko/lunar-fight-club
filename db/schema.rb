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

ActiveRecord::Schema.define(version: 20160301151256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fighter_fights", force: :cascade do |t|
    t.integer  "fight_id"
    t.integer  "fighter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fighter_fights", ["fight_id"], name: "index_fighter_fights_on_fight_id", using: :btree
  add_index "fighter_fights", ["fighter_id"], name: "index_fighter_fights_on_fighter_id", using: :btree

  create_table "fighters", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "experience_points",   default: 0
  end

  create_table "fights", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "winner_id"
    t.integer  "losser_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "level"
    t.integer  "fighter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "skills", ["fighter_id"], name: "index_skills_on_fighter_id", using: :btree

  add_foreign_key "fighter_fights", "fighters"
  add_foreign_key "fighter_fights", "fights"
  add_foreign_key "skills", "fighters"
end
