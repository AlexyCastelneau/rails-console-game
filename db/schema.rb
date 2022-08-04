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

ActiveRecord::Schema.define(version: 2022_08_02_141932) do

  create_table "actives", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "base_stats", force: :cascade do |t|
    t.integer "perso_id", null: false
    t.integer "str", default: 10
    t.integer "dex", default: 10
    t.integer "vit", default: 10
    t.integer "int", default: 10
    t.integer "wis", default: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["perso_id"], name: "index_base_stats_on_perso_id"
  end

  create_table "current_stats", force: :cascade do |t|
    t.integer "perso_id", null: false
    t.integer "current_hp"
    t.integer "max_hp"
    t.integer "current_mp"
    t.integer "max_mp"
    t.integer "str"
    t.integer "dex"
    t.integer "vit"
    t.integer "int"
    t.integer "wis"
    t.integer "armor_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["perso_id"], name: "index_current_stats_on_perso_id"
  end

  create_table "elixirs", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "enemies", force: :cascade do |t|
    t.string "type", null: false
    t.string "name", null: false
    t.string "difficulty", null: false
    t.integer "lvl", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "enemy_gears", force: :cascade do |t|
    t.integer "enemy_id", null: false
    t.integer "armor_value"
    t.integer "primary_weapon"
    t.integer "secondary_weapon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enemy_id"], name: "index_enemy_gears_on_enemy_id"
  end

  create_table "enemy_skills", force: :cascade do |t|
    t.integer "enemy_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enemy_id"], name: "index_enemy_skills_on_enemy_id"
    t.index ["skill_id"], name: "index_enemy_skills_on_skill_id"
  end

  create_table "enemy_stats", force: :cascade do |t|
    t.integer "enemy_id", null: false
    t.integer "current_hp"
    t.integer "max_hp"
    t.integer "current_mp"
    t.integer "max_mp"
    t.integer "str"
    t.integer "dex"
    t.integer "vit"
    t.integer "int"
    t.integer "wis"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enemy_id"], name: "index_enemy_stats_on_enemy_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "perso_id", null: false
    t.time "session_start", default: "2000-01-01 14:48:34", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["perso_id"], name: "index_games_on_perso_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "geared_stats", force: :cascade do |t|
    t.integer "perso_id", null: false
    t.integer "str"
    t.integer "dex"
    t.integer "vit"
    t.integer "int"
    t.integer "wis"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["perso_id"], name: "index_geared_stats_on_perso_id"
  end

  create_table "gears", force: :cascade do |t|
    t.integer "perso_id", null: false
    t.integer "head"
    t.integer "body"
    t.integer "hands"
    t.integer "legs"
    t.integer "feet"
    t.integer "primary_weapon"
    t.integer "secondary_weapon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["perso_id"], name: "index_gears_on_perso_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "perso_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_inventories_on_item_id"
    t.index ["perso_id"], name: "index_inventories_on_perso_id"
  end

  create_table "items", force: :cascade do |t|
    t.boolean "consumable", null: false
    t.integer "item"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "passives", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "persos", force: :cascade do |t|
    t.integer "user_id", null: false
    t.float "time_played"
    t.string "pseudo"
    t.integer "lvl", default: 0
    t.integer "exp", default: 0
    t.integer "exp_needed", default: 100
    t.integer "deaths", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_persos_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.text "description"
    t.boolean "active", null: false
    t.integer "skill"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skillsets", force: :cascade do |t|
    t.integer "perso_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["perso_id"], name: "index_skillsets_on_perso_id"
    t.index ["skill_id"], name: "index_skillsets_on_skill_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "game_running", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "base_stats", "persos"
  add_foreign_key "current_stats", "persos"
  add_foreign_key "enemy_gears", "enemies"
  add_foreign_key "enemy_skills", "enemies"
  add_foreign_key "enemy_skills", "skills"
  add_foreign_key "enemy_stats", "enemies"
  add_foreign_key "games", "persos"
  add_foreign_key "games", "users"
  add_foreign_key "geared_stats", "persos"
  add_foreign_key "gears", "persos"
  add_foreign_key "inventories", "items"
  add_foreign_key "inventories", "persos"
  add_foreign_key "persos", "users"
  add_foreign_key "skillsets", "persos"
  add_foreign_key "skillsets", "skills"
end
