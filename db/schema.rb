# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_01_28_042204) do
  create_table "matches", force: :cascade do |t|
    t.integer "home_score"
    t.integer "home_penalty"
    t.integer "away_score"
    t.integer "away_penalty"
    t.integer "attendance"
    t.string "venue"
    t.string "round"
    t.date "date"
    t.string "host"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "home_country_name"
    t.string "away_country_name"
    t.integer "home_country_id"
    t.integer "away_country_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "country"
    t.string "abbreviation"
    t.string "team_association"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
