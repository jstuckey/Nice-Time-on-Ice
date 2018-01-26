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

ActiveRecord::Schema.define(version: 20180126014734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", id: :serial, force: :cascade do |t|
    t.integer "game_number"
    t.date "date"
    t.boolean "playoffs"
    t.integer "season_id"
    t.integer "away_team_id"
    t.integer "home_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["game_number"], name: "index_games_on_game_number"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
    t.index ["season_id"], name: "index_games_on_season_id"
  end

  create_table "season_teams", id: :serial, force: :cascade do |t|
    t.integer "team_id"
    t.integer "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_season_teams_on_season_id"
    t.index ["team_id"], name: "index_season_teams_on_team_id"
  end

  create_table "seasons", id: :serial, force: :cascade do |t|
    t.integer "year_start"
    t.integer "year_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year_end"], name: "index_seasons_on_year_end"
    t.index ["year_start"], name: "index_seasons_on_year_start"
  end

  create_table "stats", id: :serial, force: :cascade do |t|
    t.string "request_params"
    t.string "request_context"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city", default: "", null: false
    t.string "full_name", default: "", null: false
    t.index ["abbreviation"], name: "index_teams_on_abbreviation"
    t.index ["city"], name: "index_teams_on_city"
    t.index ["full_name"], name: "index_teams_on_full_name"
  end

end
