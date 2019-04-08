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

ActiveRecord::Schema.define(version: 2019_04_08_065650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "life_points"
    t.integer "attack_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dexterity"
  end

  create_table "fights", force: :cascade do |t|
    t.bigint "winner_id"
    t.bigint "loser_id"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loser_id"], name: "index_fights_on_loser_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "attack"
    t.integer "defence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fights", "fighters", column: "loser_id"
  add_foreign_key "fights", "fighters", column: "winner_id"
end
