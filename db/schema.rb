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

ActiveRecord::Schema.define(version: 20160131195854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendarios", force: :cascade do |t|
    t.string   "evento"
    t.date     "data_inicio"
    t.date     "data_fim"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fontes", force: :cascade do |t|
    t.string   "nome"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grade_horarios", force: :cascade do |t|
    t.string   "dia"
    t.string   "hora"
    t.string   "conteudo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materias", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "cod"
    t.date     "data"
    t.string   "legenda"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "tags"
    t.boolean  "facebook"
    t.boolean  "twitter"
    t.boolean  "instagram"
    t.boolean  "app"
    t.integer  "materia_id"
    t.integer  "shares_count"
    t.integer  "fonte_id"
    t.integer  "user_id"
    t.integer  "likes_count"
    t.datetime "data_agendada"
  end

  create_table "seguidores", force: :cascade do |t|
    t.string   "screen_name"
    t.string   "name"
    t.boolean  "verified"
    t.boolean  "following"
    t.integer  "followers_count"
    t.integer  "friends_count"
    t.integer  "statuses_count"
    t.integer  "favourites_count"
    t.integer  "listed_count"
    t.string   "description"
    t.string   "location"
    t.string   "lang"
    t.string   "url"
    t.string   "profile_image_url"
    t.string   "profile_background_image_url"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "twitter_id"
    t.float    "lat"
    t.float    "long"
    t.boolean  "ativo"
    t.date     "data_unfollow"
  end

  create_table "testes", force: :cascade do |t|
    t.datetime "data_teste"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nome"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
