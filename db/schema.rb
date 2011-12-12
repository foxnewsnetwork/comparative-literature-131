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

ActiveRecord::Schema.define(:version => 20111211224826) do

  create_table "chapters", :force => true do |t|
    t.integer  "manga_id"
    t.string   "title"
    t.integer  "chapter_number"
    t.integer  "chapter_before"
    t.integer  "chapter_after"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chapters", ["chapter_number"], :name => "index_chapters_on_chapter_number"
  add_index "chapters", ["manga_id"], :name => "index_chapters_on_manga_id"

  create_table "collaborations", :force => true do |t|
    t.integer  "manga_id"
    t.string   "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "collaborator_id"
  end

  add_index "collaborations", ["collaborator_id", "manga_id"], :name => "index_collaborations_on_collaborator_id_and_manga_id", :unique => true
  add_index "collaborations", ["collaborator_id"], :name => "index_collaborations_on_collaborator_id"
  add_index "collaborations", ["manga_id"], :name => "index_collaborations_on_manga_id"

  create_table "komas", :force => true do |t|
    t.integer  "chapter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "komas", ["chapter_id"], :name => "index_komas_on_chapter_id"

  create_table "layers", :force => true do |t|
    t.integer  "koma_id"
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "layer_before"
    t.integer  "layer_after"
  end

  add_index "layers", ["koma_id", "picture_id"], :name => "index_layers_on_koma_id_and_picture_id", :unique => true
  add_index "layers", ["koma_id"], :name => "index_layers_on_koma_id"
  add_index "layers", ["picture_id"], :name => "index_layers_on_picture_id"

  create_table "mangas", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mangas", ["user_id"], :name => "index_mangas_on_user_id"

  create_table "pictures", :force => true do |t|
    t.integer  "user_id"
    t.string   "usage"
    t.string   "extension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  add_index "pictures", ["user_id"], :name => "index_pictures_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
