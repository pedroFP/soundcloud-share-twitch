# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_06_195629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "viewer_id", null: false
    t.bigint "track_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["track_id"], name: "index_likes_on_track_id"
    t.index ["viewer_id"], name: "index_likes_on_viewer_id"
  end

  create_table "samples", force: :cascade do |t|
    t.string "link"
    t.string "name"
    t.bigint "stream_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stream_id"], name: "index_samples_on_stream_id"
  end

  create_table "streams", force: :cascade do |t|
    t.string "title"
    t.datetime "aired_at"
    t.boolean "receiving_tracks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "admin_id", null: false
    t.index ["admin_id"], name: "index_streams_on_admin_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.bigint "viewer_id", null: false
    t.string "soundcloud_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "stream_id", null: false
    t.integer "likes_count", default: 0, null: false
    t.boolean "reviewed", default: false, null: false
    t.index ["stream_id"], name: "index_tracks_on_stream_id"
    t.index ["viewer_id"], name: "index_tracks_on_viewer_id"
  end

  create_table "viewers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "twitch_id"
    t.string "twitch_login"
    t.string "twitch_display_name"
    t.string "profile_image_url"
    t.boolean "subscriber", default: false
    t.index ["email"], name: "index_viewers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_viewers_on_reset_password_token", unique: true
  end

  add_foreign_key "likes", "tracks"
  add_foreign_key "likes", "viewers"
  add_foreign_key "samples", "streams"
  add_foreign_key "streams", "admins"
  add_foreign_key "tracks", "streams"
  add_foreign_key "tracks", "viewers"
end
