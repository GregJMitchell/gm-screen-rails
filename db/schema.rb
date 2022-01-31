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

ActiveRecord::Schema.define(version: 2022_01_30_231313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alignments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "gov_type"
    t.integer "population"
    t.text "description"
    t.bigint "campaign_id", null: false
    t.bigint "leader_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_cities_on_campaign_id"
    t.index ["leader_id"], name: "index_cities_on_leader_id"
  end

  create_table "monster_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "non_player_characters", force: :cascade do |t|
    t.string "name"
    t.text "backstory"
    t.bigint "campaign_id", null: false
    t.bigint "size_category_id", null: false
    t.bigint "alignment_id", null: false
    t.bigint "monster_type_id", null: false
    t.string "race"
    t.integer "challenge_rating"
    t.string "stat_block_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alignment_id"], name: "index_non_player_characters_on_alignment_id"
    t.index ["campaign_id"], name: "index_non_player_characters_on_campaign_id"
    t.index ["monster_type_id"], name: "index_non_player_characters_on_monster_type_id"
    t.index ["size_category_id"], name: "index_non_player_characters_on_size_category_id"
  end

  create_table "player_characters", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "campaign_id", null: false
    t.string "race", null: false
    t.integer "level", null: false
    t.string "character_sheet_url"
    t.integer "strength", null: false
    t.integer "dexterity", null: false
    t.integer "constitution", null: false
    t.integer "intelligence", null: false
    t.integer "wisdom", null: false
    t.integer "charisma", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_player_characters_on_campaign_id"
  end

  create_table "quests", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "rewards"
    t.bigint "campaign_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_quests_on_campaign_id"
  end

  create_table "size_categories", force: :cascade do |t|
    t.string "name"
    t.string "grid_area"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "storyline_quests", force: :cascade do |t|
    t.bigint "storyline_id", null: false
    t.bigint "quest_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quest_id"], name: "index_storyline_quests_on_quest_id"
    t.index ["storyline_id"], name: "index_storyline_quests_on_storyline_id"
  end

  create_table "storylines", force: :cascade do |t|
    t.string "name"
    t.bigint "campaign_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_storylines_on_campaign_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaigns", "users"
  add_foreign_key "cities", "campaigns"
  add_foreign_key "cities", "non_player_characters", column: "leader_id"
  add_foreign_key "non_player_characters", "alignments"
  add_foreign_key "non_player_characters", "campaigns"
  add_foreign_key "non_player_characters", "monster_types"
  add_foreign_key "non_player_characters", "size_categories"
  add_foreign_key "player_characters", "campaigns"
  add_foreign_key "quests", "campaigns"
  add_foreign_key "storyline_quests", "quests"
  add_foreign_key "storyline_quests", "storylines"
  add_foreign_key "storylines", "campaigns"
end
