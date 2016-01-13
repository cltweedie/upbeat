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

ActiveRecord::Schema.define(version: 20160113135010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "producer_id"
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "producers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "type"
  end

  add_index "producers", ["email"], name: "index_producers_on_email", unique: true, using: :btree
  add_index "producers", ["provider"], name: "index_producers_on_provider", using: :btree
  add_index "producers", ["reset_password_token"], name: "index_producers_on_reset_password_token", unique: true, using: :btree
  add_index "producers", ["uid"], name: "index_producers_on_uid", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "producer_id"
    t.string   "username"
    t.text     "bio"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "avatar"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "producer_id"
    t.integer  "sample_pack_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sample_packs", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "title"
    t.string   "file"
    t.integer  "seller_id"
    t.decimal  "price",       precision: 8, scale: 2
    t.string   "cover_image"
    t.text     "description"
  end

  create_table "sounds", force: :cascade do |t|
    t.integer  "producer_id"
    t.string   "file"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "title"
    t.integer  "instrument_id"
    t.integer  "category_id"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "sounds", ["cached_votes_down"], name: "index_sounds_on_cached_votes_down", using: :btree
  add_index "sounds", ["cached_votes_score"], name: "index_sounds_on_cached_votes_score", using: :btree
  add_index "sounds", ["cached_votes_total"], name: "index_sounds_on_cached_votes_total", using: :btree
  add_index "sounds", ["cached_votes_up"], name: "index_sounds_on_cached_votes_up", using: :btree
  add_index "sounds", ["cached_weighted_average"], name: "index_sounds_on_cached_weighted_average", using: :btree
  add_index "sounds", ["cached_weighted_score"], name: "index_sounds_on_cached_weighted_score", using: :btree
  add_index "sounds", ["cached_weighted_total"], name: "index_sounds_on_cached_weighted_total", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "sound_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
