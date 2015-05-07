# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150507122401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "moves", force: :cascade do |t|
    t.integer  "accuracy"
    t.integer  "power"
    t.integer  "pp"
    t.text     "description"
    t.string   "category"
    t.string   "name"
    t.integer  "national_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "pokemon_id"
  end

  add_index "moves", ["pokemon_id"], name: "index_moves_on_pokemon_id", using: :btree

  create_table "pokemon_moves", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "move_id"
  end

  create_table "pokemon_teams", force: :cascade do |t|
    t.integer "team_id"
    t.integer "pokemon_id"
  end

  add_index "pokemon_teams", ["pokemon_id"], name: "index_pokemon_teams_on_pokemon_id", using: :btree
  add_index "pokemon_teams", ["team_id"], name: "index_pokemon_teams_on_team_id", using: :btree

  create_table "pokemons", force: :cascade do |t|
    t.integer  "national_id"
    t.integer  "special_attack"
    t.integer  "special_defense"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "speed"
    t.integer  "hit_points"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "move_id"
  end

  add_index "pokemons", ["move_id"], name: "index_pokemons_on_move_id", using: :btree

  create_table "sprites", force: :cascade do |t|
    t.integer  "national_id"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "pokemon_id"
  end

  add_index "sprites", ["pokemon_id"], name: "index_sprites_on_pokemon_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id", using: :btree

  create_table "types", force: :cascade do |t|
    t.integer  "national_id"
    t.string   "name"
    t.string   "ineffective"
    t.string   "no_effect"
    t.string   "super_effective"
    t.string   "weakness"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "token"
    t.string   "secret"
  end

end
