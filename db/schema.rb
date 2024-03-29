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

ActiveRecord::Schema[7.0].define(version: 2023_02_09_001557) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name", null: false
    t.integer "kind", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_toy_cats", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_favorite_toy_cats_on_name", unique: true
  end

  create_table "favorite_toy_dogs", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_favorite_toy_dogs_on_name", unique: true
  end

  create_table "favorite_treat_cats", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_favorite_treat_cats_on_name", unique: true
  end

  create_table "favorite_treat_dogs", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_favorite_treat_dogs_on_name", unique: true
  end

  create_table "profile_cards", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.integer "gender"
    t.date "birthday"
    t.string "face_image"
    t.string "pad_image", null: false
    t.string "favorite_toy"
    t.string "favorite_treat"
    t.integer "personality"
    t.integer "card_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "breed_id"
    t.string "profile_card_data_a"
    t.string "profile_card_data_b"
    t.string "profile_card_data_c"
    t.string "profile_card_data_d"
    t.string "profile_card_data_e"
    t.string "profile_card_data_f"
    t.string "profile_card_data_g"
    t.string "profile_card_data_h"
    t.string "profile_card_data_i"
    t.string "profile_card_data_j"
    t.string "profile_card_data_k"
    t.string "profile_card_data_l"
    t.string "profile_card_data_m"
    t.string "profile_card_data_n"
    t.string "profile_card_data_o"
    t.string "profile_card_data_p"
    t.string "profile_card_data_q"
    t.string "profile_card_data_r"
    t.string "twitter_share_profile_card_data_a"
    t.string "twitter_share_profile_card_data_b"
    t.string "twitter_share_profile_card_data_c"
    t.string "twitter_share_profile_card_data_d"
    t.string "twitter_share_profile_card_data_e"
    t.string "twitter_share_profile_card_data_f"
    t.boolean "display_card", default: true, null: false
    t.index ["breed_id"], name: "index_profile_cards_on_breed_id"
    t.index ["user_id"], name: "index_profile_cards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "profile_cards", "breeds"
  add_foreign_key "profile_cards", "users"
end
