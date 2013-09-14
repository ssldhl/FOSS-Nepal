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

ActiveRecord::Schema.define(:version => 20130909122606) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.boolean  "state",      :default => true
    t.integer  "position",   :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "econtacts", :force => true do |t|
    t.string   "name"
    t.string   "contact"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "event_id"
  end

  create_table "elocations", :force => true do |t|
    t.float    "latitude",   :default => 27.693852455795415
    t.float    "longitude",  :default => 85.31417280435562
    t.integer  "gmaps_zoom", :default => 19
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "event_id"
  end

  create_table "eventlists", :force => true do |t|
    t.string   "name"
    t.string   "info"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "event_id"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "info"
    t.datetime "event_time"
    t.string   "venue"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "forums", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "state",        :default => true
    t.integer  "topics_count", :default => 0
    t.integer  "posts_count",  :default => 0
    t.integer  "position",     :default => 0
    t.integer  "category_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "locations", :force => true do |t|
    t.float    "latitude",   :default => 27.693852455795415
    t.float    "longitude",  :default => 85.31417280435562
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "meeting_id"
    t.integer  "gmaps_zoom", :default => 19
  end

  create_table "meetings", :force => true do |t|
    t.date     "meeting_date"
    t.string   "name"
    t.string   "info"
    t.string   "venue"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "outcomes", :force => true do |t|
    t.text     "result"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "meeting_id"
  end

  create_table "participants", :force => true do |t|
    t.string   "name"
    t.string   "contact"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "meeting_id"
  end

  create_table "posts", :force => true do |t|
    t.text     "body"
    t.integer  "forum_id"
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "results", :force => true do |t|
    t.text     "description"
    t.text     "extras"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "event_id"
  end

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.integer  "hits",        :default => 0
    t.boolean  "sticky",      :default => false
    t.boolean  "locked",      :default => false
    t.integer  "posts_count"
    t.integer  "forum_id"
    t.integer  "user_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "topics_count",    :default => 0
    t.integer  "posts_count",     :default => 0
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.boolean  "mod",             :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
