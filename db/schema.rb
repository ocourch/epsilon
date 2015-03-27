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

ActiveRecord::Schema.define(version: 20150327172532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.integer  "artist_id"
    t.date     "released"
    t.string   "record_label"
    t.string   "genre"
    t.string   "location"
    t.boolean  "in_lib?"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "lastfm_id"
    t.string   "image_url"
  end

  create_table "albums_stations", id: false, force: :cascade do |t|
    t.integer "album_id"
    t.integer "station_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "genre"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "lastfm_id"
    t.string   "image_url"
  end

  create_table "featured_artists", force: :cascade do |t|
    t.string   "artist_id"
    t.string   "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists_songs", id: false, force: :cascade do |t|
    t.integer "playlist_id"
    t.integer "song_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "user_id"
    t.string   "album_id"
    t.text     "text"
    t.integer  "upvotes"
    t.integer  "downvotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "contributing_artists"
    t.integer  "album_id"
    t.string   "title"
    t.time     "duration"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "lastfm_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string   "call_letters"
    t.string   "location"
    t.string   "bio"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "stations_users", force: :cascade do |t|
    t.integer "station_id"
    t.integer "user_id"
    t.boolean "station_admin"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "dj_alias"
    t.boolean  "site_admin"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
