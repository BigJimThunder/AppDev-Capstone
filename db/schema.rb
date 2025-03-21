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

ActiveRecord::Schema[7.1].define(version: 2025_03_06_040549) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clothing_tags", force: :cascade do |t|
    t.integer "clothing_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clothings", force: :cascade do |t|
    t.integer "user_id"
    t.string "category"
    t.string "color"
    t.string "material"
    t.string "season"
    t.string "image"
    t.string "brand"
    t.string "size"
    t.integer "outfit_items_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "favoritable_id"
    t.string "favoritable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outfit_items", force: :cascade do |t|
    t.integer "clothing_id"
    t.integer "outfit_id"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outfits", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "wardrobe_outfits_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "clothing_tags_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "wardrobes_count"
    t.integer "favorites_count"
    t.integer "outfits_count"
    t.integer "clothes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wardrobe_outfits", force: :cascade do |t|
    t.integer "wardrobe_id"
    t.integer "outfit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wardrobes", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "wardrobe_outfits_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
