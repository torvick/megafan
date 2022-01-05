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

ActiveRecord::Schema.define(version: 2022_01_03_222407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "answer"
    t.boolean "correct"
    t.string "type_answer"
    t.bigint "language_id"
    t.bigint "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_answers_on_language_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "awards", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "value"
    t.bigint "user_id"
    t.datetime "initial_date"
    t.datetime "finish_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_awards_on_user_id"
  end

  create_table "balances", force: :cascade do |t|
    t.decimal "available", default: "0.0"
    t.decimal "total", default: "0.0"
    t.bigint "type_balance_id"
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_balances_on_client_id"
    t.index ["type_balance_id"], name: "index_balances_on_type_balance_id"
  end

  create_table "banners", force: :cascade do |t|
    t.string "name"
    t.string "text_alternative"
    t.string "credits"
    t.datetime "initial_date"
    t.datetime "finish_date"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "mdd_name"
    t.string "lt_name"
    t.string "sc_lt_name"
    t.string "display_name"
    t.integer "gender"
    t.date "dob"
    t.string "phone"
    t.string "avatar"
    t.string "email"
    t.string "password_digest"
    t.datetime "last_sign_in_at", default: "2022-01-04 03:13:40"
    t.integer "sign_in_count", default: 0
    t.bigint "role_id"
    t.bigint "country_id"
    t.bigint "ranking_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_clients_on_country_id"
    t.index ["ranking_id"], name: "index_clients_on_ranking_id"
    t.index ["role_id"], name: "index_clients_on_role_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "short_name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.bigint "trivium_id"
    t.bigint "client_id"
    t.integer "status"
    t.integer "corrects"
    t.integer "incorrects"
    t.string "time_gamed"
    t.boolean "winner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_games_on_client_id"
    t.index ["trivium_id"], name: "index_games_on_trivium_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.integer "answer_corrects"
    t.bigint "language_id"
    t.bigint "trivium_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_questions_on_language_id"
    t.index ["trivium_id"], name: "index_questions_on_trivium_id"
  end

  create_table "rankings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "social_networks", force: :cascade do |t|
    t.string "name"
    t.integer "sc_key"
    t.string "sn_id"
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_social_networks_on_client_id"
  end

  create_table "trivia", force: :cascade do |t|
    t.string "name"
    t.datetime "initial_date"
    t.datetime "finish_date"
    t.bigint "category_id"
    t.integer "status"
    t.string "description"
    t.integer "dt_h"
    t.integer "dt_min"
    t.bigint "language_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_trivia_on_category_id"
    t.index ["language_id"], name: "index_trivia_on_language_id"
    t.index ["user_id"], name: "index_trivia_on_user_id"
  end

  create_table "type_balances", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "role_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
