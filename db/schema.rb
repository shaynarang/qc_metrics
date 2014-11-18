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

ActiveRecord::Schema.define(version: 20141118004048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "principal_investigators", force: true do |t|
    t.string "first_name"
    t.string "last_name"
  end

  create_table "projects", force: true do |t|
    t.integer "number"
    t.integer "principal_investigator_id"
  end

  add_index "projects", ["principal_investigator_id"], name: "index_projects_on_principal_investigator_id", using: :btree

  create_table "samples", force: true do |t|
    t.string   "identifier"
    t.integer  "total_reads"
    t.integer  "average_q_score"
    t.integer  "percent_five_x_coverage"
    t.integer  "percent_ten_x_coverage"
    t.integer  "percent_twenty_x_coverage"
    t.integer  "percent_thirty_x_coverage"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "samples", ["project_id"], name: "index_samples_on_project_id", using: :btree

end
