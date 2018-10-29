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

ActiveRecord::Schema.define(version: 2018_10_28_015847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "duties", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "duty_name", null: false
    t.string "venue", null: false
    t.datetime "start_date_time", null: false
    t.datetime "end_date_time", null: false
    t.string "contact_person", default: "-"
    t.string "contact_number", default: "-"
    t.index ["user_id"], name: "index_duties_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
    t.bigint "duty_id"
    t.index ["duty_id"], name: "index_reservations_on_duty_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "password_digest", limit: 128, null: false
    t.string "name", null: false
    t.string "ic_number"
    t.string "sjam_id"
    t.string "division"
    t.string "phone_number"
    t.boolean "driver_status", default: false
    t.string "role", default: "Member"
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "duties", "users"
  add_foreign_key "reservations", "duties"
end
