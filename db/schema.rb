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

ActiveRecord::Schema.define(version: 20150717024335) do

  create_table "applications", force: :cascade do |t|
    t.string   "english_name"
    t.string   "french_name"
    t.boolean  "critical"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "applications_departments", id: false, force: :cascade do |t|
    t.integer "application_id"
    t.integer "department_id"
  end

  add_index "applications_departments", ["application_id"], name: "index_applications_departments_on_application_id"
  add_index "applications_departments", ["department_id"], name: "index_applications_departments_on_department_id"

  create_table "applications_groups", id: false, force: :cascade do |t|
    t.integer "application_id"
    t.integer "group_id"
  end

  add_index "applications_groups", ["application_id"], name: "index_applications_groups_on_application_id"
  add_index "applications_groups", ["group_id"], name: "index_applications_groups_on_group_id"

  create_table "departments", force: :cascade do |t|
    t.string   "english_name"
    t.string   "french_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "departments_sites", id: false, force: :cascade do |t|
    t.integer "department_id"
    t.integer "site_id"
  end

  add_index "departments_sites", ["department_id"], name: "index_departments_sites_on_department_id"
  add_index "departments_sites", ["site_id"], name: "index_departments_sites_on_site_id"

  create_table "groups", force: :cascade do |t|
    t.string   "english_name"
    t.string   "french_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "groups_sites", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "site_id"
  end

  add_index "groups_sites", ["group_id"], name: "index_groups_sites_on_group_id"
  add_index "groups_sites", ["site_id"], name: "index_groups_sites_on_site_id"

  create_table "incidents", force: :cascade do |t|
    t.text     "from"
    t.text     "to"
    t.string   "update_number"
    t.string   "priority"
    t.text     "affected_departments"
    t.text     "service_impact"
    t.text     "responsible_service_support_resource_group"
    t.boolean  "resolved"
    t.text     "status"
    t.text     "resolution"
    t.string   "incident_number"
    t.datetime "actual_start_date_and_time"
    t.datetime "recorded_start_date_and_time"
    t.datetime "resolved_date_and_time"
    t.text     "incident_responsibility"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "mailing_lists", force: :cascade do |t|
    t.string   "name"
    t.text     "emails"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "site_code"
    t.string   "english_name"
    t.string   "french_name"
    t.boolean  "designated"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
