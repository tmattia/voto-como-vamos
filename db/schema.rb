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

ActiveRecord::Schema.define(:version => 20120911232500) do

  create_table "candidates", :force => true do |t|
    t.string   "name"
    t.string   "role"
    t.string   "party"
    t.string   "alliance"
    t.string   "tse_number"
    t.string   "email"
    t.text     "about"
    t.string   "phone"
    t.string   "site"
    t.string   "blog"
    t.string   "facebook"
    t.string   "twitter"
    t.boolean  "press_agent"
    t.string   "photo"
    t.string   "obfuscated_slug"
    t.string   "short_name"
    t.integer  "proposals_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "categories_proposals", :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "proposal_id", :null => false
  end

  create_table "comments", :force => true do |t|
    t.string   "fb_comment_id"
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "opinions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.integer  "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "opinions", ["proposal_id"], :name => "index_opinions_on_proposal_id"
  add_index "opinions", ["user_id", "proposal_id"], :name => "index_opinions_on_user_id_and_proposal_id", :unique => true
  add_index "opinions", ["user_id"], :name => "index_opinions_on_user_id"
  add_index "opinions", ["value"], :name => "index_opinions_on_value"

  create_table "ownerships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "candidate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposals", :force => true do |t|
    t.string   "title",                         :null => false
    t.integer  "candidate_id",                  :null => false
    t.text     "abstract",                      :null => false
    t.text     "description",                   :null => false
    t.integer  "opinions_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proposals", ["opinions_count"], :name => "index_proposals_on_opinions_count"

  create_table "questions", :force => true do |t|
    t.text     "description"
    t.integer  "proposal_id"
    t.integer  "user_id"
    t.text     "answer"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "questions", ["proposal_id"], :name => "index_questions_on_proposal_id"
  add_index "questions", ["user_id"], :name => "index_questions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
