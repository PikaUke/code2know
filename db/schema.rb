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

ActiveRecord::Schema[7.1].define(version: 2024_05_02_151226) do
  create_table "answers", force: :cascade do |t|
    t.text "text"
    t.integer "user_id", null: false
    t.integer "question_id"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "helpful"
    t.index ["answer_id"], name: "index_answers_on_answer_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "categories_questions", id: false, force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "category_id", null: false
  end

  create_table "categories_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "category_id", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "heading"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "text"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.integer "threshold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ranks_on_name", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.integer "permission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.integer "rank_id", null: false
    t.integer "xp"
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["rank_id"], name: "index_users_on_rank_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "answers", "answers"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "questions", "users"
  add_foreign_key "users", "ranks"
  add_foreign_key "users", "roles"
end
