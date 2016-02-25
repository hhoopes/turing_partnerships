# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160225215802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "partnerships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "module"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_projects", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "student_id"
    t.integer  "partnership_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "student_projects", ["partnership_id"], name: "index_student_projects_on_partnership_id", using: :btree
  add_index "student_projects", ["project_id"], name: "index_student_projects_on_project_id", using: :btree
  add_index "student_projects", ["student_id"], name: "index_student_projects_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "cohort"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
    t.string   "password_digest"
    t.integer  "role"
  end

  add_foreign_key "student_projects", "partnerships"
  add_foreign_key "student_projects", "projects"
  add_foreign_key "student_projects", "students"
end
