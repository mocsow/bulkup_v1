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

ActiveRecord::Schema[7.1].define(version: 2024_12_07_024215) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "group_order_participations", force: :cascade do |t|
    t.bigint "group_order_id", null: false
    t.bigint "member_id", null: false
    t.integer "quantity_ordered", null: false
    t.decimal "unit_price_at_order", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "bulk_discount_price_at_order", precision: 10, scale: 2, default: "0.0", null: false
    t.index ["group_order_id"], name: "index_group_order_participations_on_group_order_id"
    t.index ["member_id"], name: "index_group_order_participations_on_member_id"
  end

  create_table "group_orders", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "total_quantity", default: 0
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_group_orders_on_product_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "business_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "image_url"
    t.decimal "unit_price"
    t.decimal "bulk_discount_price", precision: 10, scale: 2, null: false
    t.integer "minimum_order_quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "group_order_participations", "group_orders"
  add_foreign_key "group_order_participations", "members"
  add_foreign_key "group_orders", "products"
end
