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

ActiveRecord::Schema.define(version: 2019_07_07_213923) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.integer "health_points", null: false
    t.integer "attack_damage", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fightings", force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "win"
    t.index ["character_id"], name: "index_fightings_on_character_id"
    t.index ["game_id"], name: "index_fightings_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_a_id"
    t.bigint "player_b_id"
    t.bigint "weapon_a_id"
    t.bigint "weapon_b_id"
    t.bigint "winner_id"
    t.index ["player_a_id"], name: "index_games_on_player_a_id"
    t.index ["player_b_id"], name: "index_games_on_player_b_id"
    t.index ["weapon_a_id"], name: "index_games_on_weapon_a_id"
    t.index ["weapon_b_id"], name: "index_games_on_weapon_b_id"
  end

  create_table "turns", force: :cascade do |t|
    t.bigint "game_id"
    t.text "line"
    t.bigint "attacker_id"
    t.bigint "attacked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "attack"
    t.integer "attacker_health_points"
    t.integer "attacked_health_points"
    t.index ["attacked_id"], name: "index_turns_on_attacked_id"
    t.index ["attacker_id"], name: "index_turns_on_attacker_id"
    t.index ["game_id"], name: "index_turns_on_game_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "fightings", "characters"
  add_foreign_key "fightings", "games"
  add_foreign_key "games", "characters", column: "player_a_id"
  add_foreign_key "games", "characters", column: "player_b_id"
  add_foreign_key "games", "weapons", column: "weapon_a_id"
  add_foreign_key "games", "weapons", column: "weapon_b_id"
  add_foreign_key "turns", "characters", column: "attacked_id"
  add_foreign_key "turns", "characters", column: "attacker_id"
  add_foreign_key "turns", "games"
end
