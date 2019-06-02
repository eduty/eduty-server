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

ActiveRecord::Schema.define(version: 20190602013411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaign_media", force: :cascade do |t|
    t.bigint "campaign_id"
    t.string "kind"
    t.string "url"
    t.index ["campaign_id"], name: "index_campaign_medias_on_campaign_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.string "description"
    t.decimal "goal"
    t.index ["course_id"], name: "index_campaigns_on_course_id"
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "campuses", force: :cascade do |t|
    t.bigint "institution_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["institution_id"], name: "index_campuses_on_institution_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.bigint "institution_id"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "campus_id"
    t.integer "semesters"
    t.index ["institution_id"], name: "index_courses_on_institution_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "campaign_id"
    t.decimal "value"
    t.string "method"
    t.string "kind"
    t.index ["campaign_id"], name: "index_payments_on_campaign_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "value"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "campaign_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cpf"
    t.datetime "birth_date"
  end

  add_foreign_key "courses", "campuses"
  add_foreign_key "transactions", "campaigns"
end
