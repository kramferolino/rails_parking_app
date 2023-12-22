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

ActiveRecord::Schema[7.1].define(version: 2023_12_22_052350) do
  create_table "entrances", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_sessions", force: :cascade do |t|
    t.integer "vehicle_id", null: false
    t.integer "entrance_id", null: false
    t.integer "parking_space_id", null: false
    t.datetime "started_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entrance_id"], name: "index_parking_sessions_on_entrance_id"
    t.index ["parking_space_id"], name: "index_parking_sessions_on_parking_space_id"
    t.index ["vehicle_id"], name: "index_parking_sessions_on_vehicle_id"
  end

  create_table "parking_spaces", force: :cascade do |t|
    t.string "parking_space_type"
    t.string "status"
    t.integer "entrance_id", null: false
    t.integer "distance_to_entrance_1"
    t.integer "distance_to_entrance_2"
    t.integer "distance_to_entrance_3"
    t.string "size_label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entrance_id"], name: "index_parking_spaces_on_entrance_id"
  end

  create_table "payment_transactions", force: :cascade do |t|
    t.integer "vehicle_id", null: false
    t.integer "parking_session_id", null: false
    t.string "transaction_id"
    t.decimal "total_payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parking_session_id"], name: "index_payment_transactions_on_parking_session_id"
    t.index ["vehicle_id"], name: "index_payment_transactions_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vehicle_type"
    t.datetime "started_at"
    t.datetime "end_at"
    t.integer "parking_space_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "entrance_id"
    t.index ["entrance_id"], name: "index_vehicles_on_entrance_id"
    t.index ["parking_space_id"], name: "index_vehicles_on_parking_space_id"
  end

  add_foreign_key "parking_sessions", "entrances"
  add_foreign_key "parking_sessions", "parking_spaces"
  add_foreign_key "parking_sessions", "vehicles"
  add_foreign_key "parking_spaces", "entrances"
  add_foreign_key "payment_transactions", "parking_sessions"
  add_foreign_key "payment_transactions", "vehicles"
  add_foreign_key "vehicles", "entrances"
  add_foreign_key "vehicles", "parking_spaces"
end
