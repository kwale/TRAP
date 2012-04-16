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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120412061318) do

  create_table "attachments", :force => true do |t|
    t.string "filename"
    t.string "content_type"
    t.binary "data"
  end

  create_table "bi_testcases", :force => true do |t|
    t.string   "suite_id"
    t.string   "test_case_id"
    t.string   "tag"
    t.integer  "time"
    t.datetime "timestamp"
    t.string   "release"
    t.string   "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.integer  "subject_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "test_cases", :force => true do |t|
    t.string   "test_suite"
    t.string   "test_id"
    t.string   "test_name"
    t.string   "duration"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "test_suites", :force => true do |t|
    t.string   "name"
    t.integer  "failures"
    t.integer  "passed"
    t.integer  "Nr_tests"
    t.string   "time"
    t.datetime "execution_time"
    t.string   "tag"
    t.string   "release"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
