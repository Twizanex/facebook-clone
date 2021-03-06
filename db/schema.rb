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

ActiveRecord::Schema.define(:version => 20130907010120) do

  create_table "comment_likes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comment_likes", ["user_id", "comment_id"], :name => "index_comment_likes_on_user_id_and_comment_id"

  create_table "comments", :force => true do |t|
    t.integer  "author_id"
    t.integer  "post_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["author_id", "post_id"], :name => "index_comments_on_author_id_and_post_id"

  create_table "follows", :force => true do |t|
    t.integer  "inbound_user_id"
    t.integer  "outbound_user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "follows", ["inbound_user_id", "outbound_user_id"], :name => "index_follows_on_inbound_user_id_and_outbound_user_id"

  create_table "group_user_joins", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "group_user_joins", ["group_id", "user_id"], :name => "index_group_user_joins_on_group_id_and_user_id"

  create_table "groups", :force => true do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
  end

  add_index "groups", ["creator_id"], :name => "index_groups_on_creator_id"

  create_table "likes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "likes", ["user_id", "post_id"], :name => "index_likes_on_user_id_and_post_id"

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.text     "body"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "messages", ["user_id", "recipient_id"], :name => "index_messages_on_user_id_and_recipient_id"

  create_table "posts", :force => true do |t|
    t.text     "body",               :null => false
    t.integer  "author_id",          :null => false
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "recipient_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "tags", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["post_id", "user_id"], :name => "index_tags_on_post_id_and_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",        :null => false
    t.string   "password_digest", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "session_token",   :null => false
  end

  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "wall_posts", :force => true do |t|
    t.integer  "author_id"
    t.integer  "recipient_id"
    t.text     "body"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "wall_posts", ["author_id", "recipient_id"], :name => "index_wall_posts_on_author_id_and_recipient_id"

end
