# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_09_113041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disciplines", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "examinations", force: :cascade do |t|
    t.datetime "date"
    t.bigint "group_id", null: false
    t.bigint "discipline_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discipline_id"], name: "index_examinations_on_discipline_id"
    t.index ["group_id"], name: "index_examinations_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lists", force: :cascade do |t|
    t.bigint "examination_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["examination_id"], name: "index_lists_on_examination_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.bigint "discipline_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discipline_id"], name: "index_questions_on_discipline_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "number"
    t.string "full_name"
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_students_on_group_id"
  end

  add_foreign_key "examinations", "disciplines"
  add_foreign_key "examinations", "groups"
  add_foreign_key "lists", "examinations"
  add_foreign_key "questions", "disciplines"
  add_foreign_key "students", "groups"
end
