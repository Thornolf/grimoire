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

ActiveRecord::Schema[7.2].define(version: 2024_09_30_125923) do
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

  create_table "character_sheets", force: :cascade do |t|
    t.string "name"
    t.integer "mission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "strength"
    t.integer "constitution"
    t.integer "dexterity"
    t.integer "intelligence"
    t.integer "power"
    t.integer "charisma"
    t.integer "hit_points"
    t.integer "willpower_points"
    t.integer "sanity"
    t.integer "breaking_point"
    t.integer "luck"
    t.integer "kind", default: 0, null: false
    t.index ["mission_id"], name: "index_character_sheets_on_mission_id"
    t.index ["user_id"], name: "index_character_sheets_on_user_id"
  end

  create_table "character_skills", force: :cascade do |t|
    t.integer "character_sheet_id", null: false
    t.integer "skill_id", null: false
    t.integer "custom_percentage"
    t.boolean "used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_sheet_id"], name: "index_character_skills_on_character_sheet_id"
    t.index ["skill_id"], name: "index_character_skills_on_skill_id"
  end

  create_table "handouts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "mission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_handouts_on_mission_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "character_sheet_id", null: false
    t.integer "item_id", null: false
    t.integer "location", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_sheet_id"], name: "index_inventories_on_character_sheet_id"
    t.index ["item_id"], name: "index_inventories_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "weight"
    t.integer "value"
    t.integer "durability", default: 0, null: false
    t.integer "rarity", default: 0, null: false
    t.text "effect"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mission_sounds", force: :cascade do |t|
    t.integer "mission_id", null: false
    t.integer "sound_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_mission_sounds_on_mission_id"
    t.index ["sound_id"], name: "index_mission_sounds_on_sound_id"
  end

  create_table "missions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "missions_users", force: :cascade do |t|
    t.integer "mission_id", null: false
    t.integer "user_id", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id", "user_id"], name: "index_missions_users_on_mission_id_and_user_id", unique: true
    t.index ["mission_id"], name: "index_missions_users_on_mission_id"
    t.index ["user_id"], name: "index_missions_users_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.integer "base_percentage"
    t.string "category"
    t.boolean "default", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sounds", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "character_sheets", "missions"
  add_foreign_key "character_skills", "character_sheets"
  add_foreign_key "character_skills", "skills"
  add_foreign_key "handouts", "missions"
  add_foreign_key "inventories", "character_sheets"
  add_foreign_key "inventories", "items"
  add_foreign_key "mission_sounds", "missions"
  add_foreign_key "mission_sounds", "sounds"
  add_foreign_key "missions_users", "missions"
  add_foreign_key "missions_users", "users"
end
