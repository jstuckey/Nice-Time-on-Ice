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

ActiveRecord::Schema.define(version: 20150821234457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "game_number"
    t.date     "date"
    t.boolean  "playoffs"
    t.integer  "season_id"
    t.integer  "away_team_id"
    t.integer  "home_team_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "games", ["season_id"], name: "index_games_on_season_id", using: :btree

  create_table "season_teams", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "season_teams", ["season_id"], name: "index_season_teams_on_season_id", using: :btree
  add_index "season_teams", ["team_id"], name: "index_season_teams_on_team_id", using: :btree

  create_table "seasons", force: :cascade do |t|
    t.integer  "year_start"
    t.integer  "year_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
