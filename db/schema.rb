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

ActiveRecord::Schema.define(version: 2021_04_05_180347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gunplas", force: :cascade do |t|
    t.string "kit_name"
    t.string "gundam_name"
    t.string "grade"
    t.string "scale"
    t.string "gundam_series"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gunplas_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "gunpla_id", null: false
    t.index ["gunpla_id"], name: "index_gunplas_users_on_gunpla_id"
    t.index ["user_id"], name: "index_gunplas_users_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.integer "rating"
    t.string "content_body"
    t.integer "user_id"
    t.integer "gunpla_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "gunplas_users", "gunplas"
  add_foreign_key "gunplas_users", "users"
  add_foreign_key "reviews", "gunplas"
  add_foreign_key "reviews", "users"
end
