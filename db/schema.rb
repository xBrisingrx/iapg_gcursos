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

ActiveRecord::Schema[7.2].define(version: 2024_10_22_132454) do
  create_table "calendar_courses", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.date "date", null: false
    t.bigint "course_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_calendar_courses_on_course_id"
  end

  create_table "calendar_instructors", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.bigint "instructor_id", null: false
    t.datetime "date", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_calendar_instructors_on_instructor_id"
  end

  create_table "cities", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.boolean "active", default: true
    t.bigint "province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "province_id"], name: "index_cities_on_name_and_province_id", unique: true
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "cuit", limit: 30, null: false
    t.string "direction", limit: 100
    t.string "phone", limit: 40
    t.boolean "operator", default: false, null: false
    t.string "comment"
    t.bigint "iva_condition_id", null: false
    t.bigint "company_category_id", null: false
    t.bigint "sector_id", null: false
    t.bigint "province_id", null: false
    t.bigint "city_id", null: false
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

  create_table "company_categories", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "quota", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_company_categories_on_name", unique: true
  end

  create_table "company_managers", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "person_id", null: false
    t.string "email"
    t.string "function"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_managers_on_company_id"
    t.index ["person_id"], name: "index_company_managers_on_person_id"
  end

  create_table "course_instructors", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "instructor_id", null: false
    t.bigint "unit_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_instructors_on_course_id"
    t.index ["instructor_id"], name: "index_course_instructors_on_instructor_id"
    t.index ["unit_id"], name: "index_course_instructors_on_unit_id"
  end

  create_table "course_people", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "person_id", null: false
    t.bigint "manager_id"
    t.bigint "company_id", null: false
    t.bigint "operator_id"
    t.bigint "inscription_motive_id", null: false
    t.bigint "fleet_category_id", null: false
    t.bigint "unit_id", null: false
    t.date "date", null: false
    t.time "from_hour"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "to_hour"
    t.index ["company_id"], name: "index_course_people_on_company_id"
    t.index ["course_id"], name: "index_course_people_on_course_id"
    t.index ["fleet_category_id"], name: "index_course_people_on_fleet_category_id"
    t.index ["inscription_motive_id"], name: "index_course_people_on_inscription_motive_id"
    t.index ["manager_id"], name: "index_course_people_on_manager_id"
    t.index ["operator_id"], name: "index_course_people_on_operator_id"
    t.index ["person_id"], name: "index_course_people_on_person_id"
    t.index ["unit_id"], name: "index_course_people_on_unit_id"
  end

  create_table "course_type_units", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.bigint "course_type_id", null: false
    t.bigint "unit_id", null: false
    t.integer "day"
    t.time "start_hour"
    t.time "end_hour"
    t.boolean "is_by_turn"
    t.integer "shift_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shift"
    t.index ["course_type_id"], name: "index_course_type_units_on_course_type_id"
    t.index ["unit_id"], name: "index_course_type_units_on_unit_id"
  end

  create_table "course_types", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
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
    t.bigint "room_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_course_types_on_room_id"
  end

  create_table "course_unit_tests", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.bigint "test_id", null: false
    t.bigint "course_unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_unit_id"], name: "index_course_unit_tests_on_course_unit_id"
    t.index ["test_id"], name: "index_course_unit_tests_on_test_id"
  end

  create_table "course_units", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "unit_id", null: false
    t.bigint "instructor_id", null: false
    t.string "shift"
    t.integer "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_units_on_course_id"
    t.index ["instructor_id"], name: "index_course_units_on_instructor_id"
    t.index ["unit_id"], name: "index_course_units_on_unit_id"
  end

  create_table "courses", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.date "from_date", null: false
    t.integer "year_number", null: false
    t.integer "general_number", null: false
    t.boolean "is_company", default: false
    t.string "code", limit: 10
    t.bigint "course_type_id", null: false
    t.bigint "room_id", null: false
    t.bigint "company_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "to_date"
    t.index ["company_id"], name: "index_courses_on_company_id"
    t.index ["course_type_id"], name: "index_courses_on_course_type_id"
    t.index ["room_id"], name: "index_courses_on_room_id"
  end

  create_table "fleet_categories", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "headquarters", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sectional_id", null: false
    t.bigint "province_id", null: false
    t.bigint "city_id", null: false
    t.boolean "can_make_psychometric", default: false
    t.index ["city_id"], name: "index_headquarters_on_city_id"
    t.index ["name"], name: "index_headquarters_on_name", unique: true
    t.index ["province_id"], name: "index_headquarters_on_province_id"
    t.index ["sectional_id"], name: "index_headquarters_on_sectional_id"
  end

  create_table "inscription_motives", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructors", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iva_conditions", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_iva_conditions_on_name", unique: true
  end

  create_table "people", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "cuil", limit: 20, null: false
    t.string "last_name", limit: 50, null: false
    t.string "name", limit: 50, null: false
    t.date "birthdate", null: false
    t.string "phone", limit: 50, null: false
    t.string "celphone", limit: 50, null: false
    t.string "email", limit: 50, null: false
    t.string "direction", limit: 100, null: false
    t.string "code", limit: 6
    t.bigint "province_id"
    t.bigint "city_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_people_on_city_id"
    t.index ["province_id"], name: "index_people_on_province_id"
  end

  create_table "provinces", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "fleet", null: false
    t.boolean "eliminating", default: false
    t.integer "score", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "capacity", null: false
    t.bigint "headquarter_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["headquarter_id"], name: "index_rooms_on_headquarter_id"
  end

  create_table "sectionals", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "direction", null: false
    t.bigint "city_id", null: false
    t.bigint "province_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_sectionals_on_city_id"
    t.index ["province_id"], name: "index_sectionals_on_province_id"
  end

  create_table "sectors", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sectors_on_name", unique: true
  end

  create_table "tests", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "instance", null: false
    t.string "fleet", null: false
    t.string "modality", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turns", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "unit_id", null: false
    t.bigint "person_id"
    t.date "date"
    t.time "hour"
    t.boolean "available", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_turns_on_course_id"
    t.index ["person_id"], name: "index_turns_on_person_id"
    t.index ["unit_id"], name: "index_turns_on_unit_id"
  end

  create_table "units", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "fleet", null: false
    t.string "methodology", null: false
    t.string "category", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "calendar_courses", "courses"
  add_foreign_key "calendar_instructors", "instructors"
  add_foreign_key "cities", "provinces"
  add_foreign_key "companies", "cities"
  add_foreign_key "companies", "company_categories"
  add_foreign_key "companies", "iva_conditions"
  add_foreign_key "companies", "provinces"
  add_foreign_key "companies", "sectors"
  add_foreign_key "company_managers", "companies"
  add_foreign_key "company_managers", "people"
  add_foreign_key "course_instructors", "courses"
  add_foreign_key "course_instructors", "instructors"
  add_foreign_key "course_instructors", "units"
  add_foreign_key "course_people", "companies"
  add_foreign_key "course_people", "companies", column: "operator_id"
  add_foreign_key "course_people", "courses"
  add_foreign_key "course_people", "fleet_categories"
  add_foreign_key "course_people", "inscription_motives"
  add_foreign_key "course_people", "people"
  add_foreign_key "course_people", "people", column: "manager_id"
  add_foreign_key "course_people", "units"
  add_foreign_key "course_type_units", "course_types"
  add_foreign_key "course_type_units", "units"
  add_foreign_key "course_types", "rooms"
  add_foreign_key "course_unit_tests", "course_units"
  add_foreign_key "course_unit_tests", "tests"
  add_foreign_key "course_units", "courses"
  add_foreign_key "course_units", "instructors"
  add_foreign_key "course_units", "units"
  add_foreign_key "courses", "companies"
  add_foreign_key "courses", "course_types"
  add_foreign_key "courses", "rooms"
  add_foreign_key "headquarters", "cities"
  add_foreign_key "headquarters", "provinces"
  add_foreign_key "headquarters", "sectionals"
  add_foreign_key "people", "cities"
  add_foreign_key "people", "provinces"
  add_foreign_key "rooms", "headquarters"
  add_foreign_key "sectionals", "cities"
  add_foreign_key "sectionals", "provinces"
  add_foreign_key "turns", "courses"
  add_foreign_key "turns", "people"
  add_foreign_key "turns", "units"
end
