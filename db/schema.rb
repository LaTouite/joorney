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

ActiveRecord::Schema.define(version: 2019_09_02_143138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "unit_price"
    t.string "category"
    t.string "schedule"
    t.integer "min_number_of_participants"
    t.integer "max_number_of_participants"
    t.integer "min_age"
    t.integer "duration"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "main_photo"
    t.string "second_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "choices", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "suggestion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suggestion_id"], name: "index_choices_on_suggestion_id"
    t.index ["user_id"], name: "index_choices_on_user_id"
  end

  create_table "event_activities", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "event_id"
    t.boolean "favorite", default: false
    t.boolean "selected", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nb_of_participants"
    t.index ["activity_id"], name: "index_event_activities_on_activity_id"
    t.index ["event_id"], name: "index_event_activities_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "event_category"
    t.string "thematics", array: true
    t.date "start_date"
    t.date "end_date"
    t.string "destination"
    t.integer "budget_per_participant_cents", default: 0, null: false
    t.string "budget_per_participant_currency", default: "EUR", null: false
    t.string "photo"
    t.date "deadline"
    t.string "token"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accomodation_presence", default: false
    t.string "accomodation_address"
    t.integer "accomodation_price_cents", default: 0, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.string "value"
    t.date "start_date"
    t.date "end_date"
    t.boolean "selected", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "survey_id"
    t.string "topic"
    t.index ["survey_id"], name: "index_suggestions_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name"
    t.date "deadline"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_surveys_on_event_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.boolean "present", default: false
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.boolean "action1", default: false
    t.boolean "action2", default: false
    t.string "time_ago"
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "profile_picture"
    t.string "phone_number"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "choices", "suggestions"
  add_foreign_key "choices", "users"
  add_foreign_key "event_activities", "activities"
  add_foreign_key "event_activities", "events"
  add_foreign_key "events", "users"
  add_foreign_key "suggestions", "surveys"
  add_foreign_key "surveys", "events"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
end
