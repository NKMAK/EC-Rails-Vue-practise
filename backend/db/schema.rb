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

ActiveRecord::Schema[7.2].define(version: 2025_03_16_025455) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_itemes", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", default: 1
    t.decimal "price", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_itemes_on_cart_id"
    t.index ["product_id"], name: "index_cart_itemes_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.uuid "user_uuid"
    t.decimal "total_price", precision: 10, scale: 2, default: "0.0"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_uuid"], name: "index_carts_on_user_uuid"
  end

  create_table "product_images", force: :cascade do |t|
    t.bigint "product_id"
    t.string "image"
    t.integer "display_order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.decimal "price", precision: 10, scale: 2, null: false
    t.integer "stock_quantity", default: 0
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_products_on_title"
  end

  create_table "refresh_tokens", force: :cascade do |t|
    t.uuid "user_uuid", null: false
    t.string "token", null: false
    t.datetime "expires_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_refresh_tokens_on_token", unique: true
    t.index ["user_uuid"], name: "index_refresh_tokens_on_user_uuid"
  end

  create_table "users", force: :cascade do |t|
    t.uuid "user_uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "is_admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_uuid"], name: "index_users_on_user_uuid", unique: true
  end

  add_foreign_key "cart_itemes", "carts"
  add_foreign_key "cart_itemes", "products"
  add_foreign_key "carts", "users", column: "user_uuid", primary_key: "user_uuid"
  add_foreign_key "refresh_tokens", "users", column: "user_uuid", primary_key: "user_uuid"
end
