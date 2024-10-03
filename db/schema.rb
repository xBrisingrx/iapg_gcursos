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

ActiveRecord::Schema[7.2].define(version: 2024_10_02_212807) do
  create_table "cities", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.boolean "active", default: true
    t.integer "province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "province_id"], name: "index_cities_on_name_and_province_id", unique: true
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "cuit", limit: 30, null: false
    t.string "direction", limit: 100
    t.string "phone", limit: 40
    t.boolean "operator", default: false, null: false
    t.string "comment"
    t.integer "iva_condition_id", null: false
    t.integer "company_category_id", null: false
    t.integer "sector_id", null: false
    t.integer "province_id", null: false
    t.integer "city_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_companies_on_city_id"
    t.index ["company_category_id"], name: "index_companies_on_company_category_id"
    t.index ["cuit"], name: "index_companies_on_cuit", unique: true
    t.index ["iva_condition_id"], name: "index_companies_on_iva_condition_id"
    t.index ["name"], name: "index_companies_on_name", unique: true
    t.index ["province_id"], name: "index_companies_on_province_id"
    t.index ["sector_id"], name: "index_companies_on_sector_id"
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

  create_table "course_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "min_quota", null: false
    t.integer "max_quota", null: false
    t.integer "min_score", null: false
    t.integer "max_score", null: false
    t.integer "passing_score", null: false
    t.integer "number_of_repeat", null: false
    t.boolean "need_code", default: false
    t.integer "fleet", null: false
    t.integer "room_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_course_types_on_room_id"
  end

  create_table "course_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "min_quota", null: false
    t.integer "max_quota", null: false
    t.integer "min_score", null: false
    t.integer "max_score", null: false
    t.integer "passing_score", null: false
    t.integer "number_of_repeat", null: false
    t.boolean "need_code", default: false
    t.integer "room_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_course_types_on_room_id"
  end

  create_table "headquarters", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sectional_id", null: false
    t.integer "province_id", null: false
    t.integer "city_id", null: false
    t.boolean "can_make_psychometric", default: false
    t.index ["city_id"], name: "index_headquarters_on_city_id"
    t.index ["name"], name: "index_headquarters_on_name", unique: true
    t.index ["province_id"], name: "index_headquarters_on_province_id"
    t.index ["sectional_id"], name: "index_headquarters_on_sectional_id"
  end

  create_table "iva_conditions", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_iva_conditions_on_name", unique: true
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
    t.integer "province_id"
    t.integer "city_id"
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

  create_table "questions", force: :cascade do |t|
    t.string "name", null: false
    t.string "fleet", null: false
    t.boolean "eliminating", default: false
    t.integer "score", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "capacity", null: false
    t.integer "headquarter_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["headquarter_id"], name: "index_rooms_on_headquarter_id"
  end

  create_table "sectionals", force: :cascade do |t|
    t.string "name", null: false
    t.string "direction", null: false
    t.integer "city_id", null: false
    t.integer "province_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_sectionals_on_city_id"
    t.index ["province_id"], name: "index_sectionals_on_province_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sectors_on_name", unique: true
  end

  create_table "tests", force: :cascade do |t|
    t.string "name", null: false
    t.string "instance", null: false
    t.string "fleet", null: false
    t.string "modality", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cities", "provinces"
  add_foreign_key "companies", "cities"
  add_foreign_key "companies", "company_categories"
  add_foreign_key "companies", "iva_conditions"
  add_foreign_key "companies", "provinces"
  add_foreign_key "companies", "sectors"
  add_foreign_key "course_types", "rooms"
  add_foreign_key "headquarters", "cities"
  add_foreign_key "headquarters", "provinces"
  add_foreign_key "headquarters", "sectionals"
  add_foreign_key "people", "cities"
  add_foreign_key "people", "provinces"
  add_foreign_key "rooms", "headquarters"
  add_foreign_key "sectionals", "cities"
  add_foreign_key "sectionals", "provinces"
end
