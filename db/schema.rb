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

ActiveRecord::Schema.define(:version => 20140909216500) do

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.datetime "pub_date"
    t.string   "rating"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "length"
    t.integer  "fav_count"
    t.string   "poster_url"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.datetime "birthdate"
    t.datetime "deathdate"
    t.string   "bio"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.integer  "person_id"
    t.string   "character_name"
    t.string   "type"
    t.string   "bio"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "updates", :force => true do |t|
    t.integer  "user_movie_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "updates", ["created_at"], :name => "updates_created_at"

  create_table "user_movies", :force => true do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.string   "rating"
    t.text     "review"
    t.integer  "like_count"
    t.float    "weight"
    t.string   "title"
    t.integer  "watch_count"
    t.datetime "watch_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "location"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "image_url"
  end

end
