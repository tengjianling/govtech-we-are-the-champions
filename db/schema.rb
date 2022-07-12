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

ActiveRecord::Schema[7.0].define(version: 2022_07_10_173516) do
  create_table "matches", charset: "utf8mb3", force: :cascade do |t|
    t.integer "team1_id"
    t.integer "team2_id"
    t.integer "team1_score"
    t.integer "team2_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches_creators", charset: "utf8mb3", force: :cascade do |t|
    t.text "user_input"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.integer "goals"
    t.integer "alternative_points"
    t.integer "group"
    t.date "registration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.date "registration_date"
    t.integer "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams_creators", charset: "utf8mb3", force: :cascade do |t|
    t.text "user_input"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
