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

ActiveRecord::Schema[7.1].define(version: 2023_12_25_035347) do
  create_table "entrances", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_sessions", force: :cascade do |t|
    t.integer "vehicle_id", null: false
    t.integer "parking_space_id", null: false
    t.integer "base_fee", default: 40
    t.integer "fee", default: 0
    t.integer "total_fee", default: 0
    t.boolean "fee_estimated", default: true
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parking_space_id"], name: "index_parking_sessions_on_parking_space_id"
    t.index ["vehicle_id"], name: "index_parking_sessions_on_vehicle_id"
  end

  create_table "parking_spaces", force: :cascade do |t|
    t.integer "entrance_id", null: false
    t.integer "vehicle_id"
    t.integer "space_size"
    t.boolean "available", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entrance_id"], name: "index_parking_spaces_on_entrance_id"
    t.index ["vehicle_id"], name: "index_parking_spaces_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "vehicle_size"
    t.boolean "parked", default: false
    t.datetime "start_at", default: "2023-12-26 18:32:03"
    t.datetime "end_at"
    t.integer "base_fee", default: 40
    t.integer "fee", default: 0
    t.integer "total_fee", default: 0
    t.boolean "fee_estimated", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "parking_sessions", "parking_spaces"
  add_foreign_key "parking_sessions", "vehicles"
  add_foreign_key "parking_spaces", "entrances"
  add_foreign_key "parking_spaces", "vehicles"
end
