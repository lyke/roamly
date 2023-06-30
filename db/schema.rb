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

ActiveRecord::Schema[7.0].define(version: 2023_06_29_204121) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
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
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "place_taggings", force: :cascade do |t|
    t.bigint "place_tag_id", null: false
    t.bigint "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_place_taggings_on_place_id"
    t.index ["place_tag_id"], name: "index_place_taggings_on_place_tag_id"
  end

  create_table "place_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "place_trav_taggings", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.bigint "place_traveler_type_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_place_trav_taggings_on_place_id"
    t.index ["place_traveler_type_tag_id"], name: "index_place_trav_taggings_on_place_traveler_type_tag_id"
  end

  create_table "place_traveler_type_tags", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.integer "duration"
    t.boolean "secret_spot", default: false
    t.integer "min_temp"
    t.integer "max_temp"
    t.boolean "touristic", default: false
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.boolean "validation", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.integer "duration"
    t.bigint "travel_id", null: false
    t.bigint "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_steps_on_place_id"
    t.index ["travel_id"], name: "index_steps_on_travel_id"
  end

  create_table "trav_trav_taggings", force: :cascade do |t|
    t.bigint "trav_trav_type_tag_id", null: false
    t.bigint "travel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trav_trav_type_tag_id"], name: "index_trav_trav_taggings_on_trav_trav_type_tag_id"
    t.index ["travel_id"], name: "index_trav_trav_taggings_on_travel_id"
  end

  create_table "trav_trav_type_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travel_taggings", force: :cascade do |t|
    t.bigint "travel_id", null: false
    t.bigint "travel_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["travel_id"], name: "index_travel_taggings_on_travel_id"
    t.index ["travel_tag_id"], name: "index_travel_taggings_on_travel_tag_id"
  end

  create_table "travel_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travels", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "beginning_date"
    t.date "ending_date"
    t.float "longitude"
    t.float "latitude"
    t.integer "nb_traveler"
    t.boolean "incl_secret"
    t.float "budget"
    t.integer "touristic"
    t.string "starting_point"
    t.integer "local_temperature"
    t.datetime "start_hour"
    t.datetime "end_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_travels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "place_taggings", "place_tags"
  add_foreign_key "place_taggings", "places"
  add_foreign_key "place_trav_taggings", "place_traveler_type_tags"
  add_foreign_key "place_trav_taggings", "places"
  add_foreign_key "places", "users"
  add_foreign_key "steps", "places"
  add_foreign_key "steps", "travels"
  add_foreign_key "trav_trav_taggings", "trav_trav_type_tags"
  add_foreign_key "trav_trav_taggings", "travels"
  add_foreign_key "travel_taggings", "travel_tags"
  add_foreign_key "travel_taggings", "travels"
  add_foreign_key "travels", "users"
end
