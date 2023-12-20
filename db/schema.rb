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

ActiveRecord::Schema[7.1].define(version: 2023_12_19_071421) do
  create_table "entrances", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "parking_space_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parking_space_id"], name: "index_entrances_on_parking_space_id"
  end

  create_table "parking_slots", force: :cascade do |t|
    t.integer "parking_space_id", null: false
    t.integer "entrance_id"
    t.integer "vehicle_id"
    t.integer "size", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entrance_id"], name: "index_parking_slots_on_entrance_id"
    t.index ["parking_space_id"], name: "index_parking_slots_on_parking_space_id"
    t.index ["vehicle_id"], name: "index_parking_slots_on_vehicle_id"
  end

  create_table "parking_spaces", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parking_slots_count", default: 0
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "size", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parking_slot_id", null: false
    t.index ["parking_slot_id"], name: "index_vehicles_on_parking_slot_id"
  end

  add_foreign_key "entrances", "parking_spaces"
  add_foreign_key "parking_slots", "entrances"
  add_foreign_key "parking_slots", "parking_spaces"
  add_foreign_key "parking_slots", "vehicles"
  add_foreign_key "vehicles", "parking_slots"
end
