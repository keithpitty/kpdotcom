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

ActiveRecord::Schema.define(version: 20190228110811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.integer  "rank"
    t.string   "heading",     limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.string   "title",      limit: 255
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "post"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "param",         limit: 255
    t.boolean  "comments_open"
    t.datetime "published_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "blog_post_id"
    t.string   "name",         limit: 255
    t.string   "email",        limit: 255
    t.string   "website",      limit: 255
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_ip",      limit: 255
    t.string   "user_agent",   limit: 255
    t.string   "referrer",     limit: 255
    t.boolean  "approved",                 default: false, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "subject",    limit: 255
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "picture_file_name",    limit: 255
    t.string   "picture_content_type", limit: 255
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "services", force: :cascade do |t|
    t.string  "name",        limit: 255
    t.string  "heading",     limit: 255
    t.text    "description"
    t.integer "rank"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string  "provider_name",     limit: 255
    t.string  "provider_position", limit: 255
    t.text    "recommendation"
    t.integer "rank"
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",             limit: 255, null: false
    t.string   "crypted_password",  limit: 255, null: false
    t.string   "password_salt",     limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "persistence_token", limit: 255, null: false
  end

end
