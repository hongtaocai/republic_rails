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

ActiveRecord::Schema.define(version: 20140417042303) do

  create_table "answers", force: true do |t|
    t.integer  "user_id"
    t.integer  "vote"
    t.date     "created_time"
    t.text     "content"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "voters_count"
  end

  create_table "avotes", force: true do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "avotes", ["answer_id"], name: "index_avotes_on_answer_id", using: :btree
  add_index "avotes", ["user_id", "answer_id"], name: "index_avotes_on_user_id_and_answer_id", unique: true, using: :btree
  add_index "avotes", ["user_id"], name: "index_avotes_on_user_id", using: :btree

  create_table "publications", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "abstract"
    t.integer  "rating"
    t.string   "google_url"
    t.string   "journal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "voters_count", default: 0
  end

  create_table "questions", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "vote"
    t.integer  "publication_id"
    t.datetime "created_time"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "voters_count"
  end

  create_table "qvotes", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "qvotes", ["question_id", "user_id"], name: "index_qvotes_on_question_id_and_user_id", unique: true, using: :btree
  add_index "qvotes", ["question_id"], name: "index_qvotes_on_question_id", using: :btree
  add_index "qvotes", ["user_id"], name: "index_qvotes_on_user_id", using: :btree

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "voters_count"
  end

  add_index "reviews", ["publication_id"], name: "index_reviews_on_publication_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "rvotes", force: true do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rvotes", ["review_id"], name: "index_rvotes_on_review_id", using: :btree
  add_index "rvotes", ["user_id", "review_id"], name: "index_rvotes_on_user_id_and_review_id", unique: true, using: :btree
  add_index "rvotes", ["user_id"], name: "index_rvotes_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "photo_url"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "voteactions", force: true do |t|
    t.integer  "user_id"
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "voteactions", ["publication_id", "user_id"], name: "index_voteactions_on_publication_id_and_user_id", unique: true, using: :btree
  add_index "voteactions", ["publication_id"], name: "index_voteactions_on_publication_id", using: :btree
  add_index "voteactions", ["user_id"], name: "index_voteactions_on_user_id", using: :btree

end
