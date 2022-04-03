# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_01_02_104953) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", id: :serial, force: :cascade do |t|
    t.integer "rank"
    t.string "heading", limit: 255
    t.text "description"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", limit: 255
    t.text "body"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "blog_posts", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "post"
    t.boolean "published"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "param", limit: 255
    t.boolean "comments_open"
    t.datetime "published_at", precision: nil
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "blog_post_id"
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.string "website", limit: 255
    t.text "comment"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "user_ip", limit: 255
    t.string "user_agent", limit: 255
    t.string "referrer", limit: 255
    t.boolean "approved", default: false, null: false
  end

  create_table "contacts", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.string "subject", limit: 255
    t.text "message"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "images", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "picture_file_name", limit: 255
    t.string "picture_content_type", limit: 255
    t.integer "picture_file_size"
    t.datetime "picture_updated_at", precision: nil
  end

  create_table "testimonials", id: :serial, force: :cascade do |t|
    t.string "provider_name", limit: 255
    t.string "provider_position", limit: 255
    t.text "recommendation"
    t.integer "rank"
    t.integer "recommendation_year"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "login", limit: 255, null: false
    t.string "crypted_password", limit: 255, null: false
    t.string "password_salt", limit: 255, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "persistence_token", limit: 255, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
