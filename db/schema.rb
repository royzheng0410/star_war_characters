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

ActiveRecord::Schema.define(version: 20191104082920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "species"
    t.string "gender"
    t.string "weapon"
    t.string "vehicle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name"], name: "index_people_on_first_name"
    t.index ["gender"], name: "index_people_on_gender"
    t.index ["last_name"], name: "index_people_on_last_name"
    t.index ["species"], name: "index_people_on_species"
    t.index ["vehicle"], name: "index_people_on_vehicle"
    t.index ["weapon"], name: "index_people_on_weapon"
  end

  create_table "person_affiliations", force: :cascade do |t|
    t.integer "person_id"
    t.integer "affiliation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_locations", force: :cascade do |t|
    t.integer "person_id"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
