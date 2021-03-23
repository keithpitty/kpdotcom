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

ActiveRecord::Schema.define(version: 2020_04_14_192727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.integer "rank"
    t.string "heading"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "title"
    t.text "post"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "param"
    t.boolean "comments_open"
    t.datetime "published_at"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "blog_post_id"
    t.string "name"
    t.string "email"
    t.string "website"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_ip"
    t.string "user_agent"
    t.string "referrer"
    t.boolean "approved", default: false, null: false
    t.index ["blog_post_id"], name: "index_comments_on_blog_post_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "subject"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.bigint "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "heading"
    t.text "description"
    t.integer "rank"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string "provider_name"
    t.string "provider_position"
    t.text "recommendation"
    t.integer "rank"
    t.integer "recommendation_year"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.string "crypted_password", null: false
    t.string "password_salt", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "persistence_token", null: false
  end

end
