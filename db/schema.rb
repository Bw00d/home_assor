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

ActiveRecord::Schema[8.0].define(version: 2025_11_01_160607) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.string "parcel_number"
    t.date "assessment_date"
    t.string "assessor_name"
    t.string "property_address"
    t.integer "gate"
    t.integer "ing_egg"
    t.integer "road_cond"
    t.integer "bridge_weight"
    t.integer "driveway_width"
    t.integer "drivelen"
    t.integer "turn"
    t.integer "roof"
    t.integer "clean"
    t.integer "eaves"
    t.integer "vents"
    t.integer "bld_ext"
    t.integer "decks"
    t.integer "comb_mat"
    t.integer "propane"
    t.integer "site_water"
    t.integer "fveg_z1"
    t.integer "sveg_z1"
    t.integer "lad_fl1"
    t.integer "fveg_z2"
    t.integer "sveg_z2"
    t.integer "lad_fuel_2"
    t.integer "contfuel"
    t.integer "struct_alignment"
    t.integer "slope"
    t.integer "setback"
    t.integer "pos_slope"
    t.integer "aspect"
    t.integer "ff_risk_access"
    t.integer "ff_risk_propgas"
    t.integer "ff_risk_ohpower"
    t.integer "ff_risk_pets"
    t.integer "ff_risk_hazmat"
    t.integer "ff_risk_escape_safety"
    t.integer "ff_risk_solar"
    t.integer "risk_category"
    t.decimal "total_score", precision: 10, scale: 2
    t.text "notes"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_date"], name: "index_assessments_on_assessment_date"
    t.index ["latitude", "longitude"], name: "index_assessments_on_latitude_and_longitude"
    t.index ["parcel_number"], name: "index_assessments_on_parcel_number"
    t.index ["risk_category"], name: "index_assessments_on_risk_category"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
