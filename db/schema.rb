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

ActiveRecord::Schema[7.2].define(version: 2024_09_30_155809) do
  create_table "cities", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.boolean "active", default: true
    t.integer "province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "province_id"], name: "index_cities_on_name_and_province_id", unique: true
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "company_areas", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_company_areas_on_name", unique: true
  end

  create_table "company_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "quota", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_company_categories_on_name", unique: true
  end

  create_table "people", force: :cascade do |t|
    t.string "cuil", limit: 20, null: false
    t.string "last_name", limit: 50, null: false
    t.string "name", limit: 50, null: false
    t.date "birthdate", null: false
    t.string "phone", limit: 50, null: false
    t.string "celphone", limit: 50, null: false
    t.string "email", limit: 50, null: false
    t.string "direction", limit: 100, null: false
    t.string "code", limit: 6
    t.integer "province_id", null: false
    t.integer "city_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_people_on_city_id"
    t.index ["province_id"], name: "index_people_on_province_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cities", "provinces"
  add_foreign_key "people", "cities"
  add_foreign_key "people", "provinces"
end
