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

ActiveRecord::Schema.define(version: 2019_01_03_144812) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.integer "calories_burned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_activities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "activity_id"
    t.integer "mins_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_foods", force: :cascade do |t|
    t.integer "user_id"
    t.integer "food_id"
    t.integer "servings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.float "height"
    t.float "weight"
    t.string "gender"
    t.string "goal"
    t.string "email"
    t.string "password"
    t.string "password_digest"
    t.boolean "user_setting"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
