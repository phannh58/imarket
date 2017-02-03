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

ActiveRecord::Schema.define(version: 20170203024421) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "image",      limit: 255
    t.integer  "store_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "categories", ["store_id"], name: "index_categories_on_store_id", using: :btree

  create_table "commerce_centers", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "image",       limit: 255
    t.string   "address",     limit: 255
    t.decimal  "latitude",                precision: 10, scale: 6
    t.decimal  "longtitude",              precision: 10, scale: 6
    t.integer  "district_id", limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "commerce_centers", ["district_id"], name: "index_commerce_centers_on_district_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "province_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "districts", ["province_id"], name: "index_districts_on_province_id", using: :btree

  create_table "edges", force: :cascade do |t|
    t.integer  "point_start_id", limit: 4
    t.integer  "point_end_id",   limit: 4
    t.decimal  "balance",                  precision: 10
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "edges", ["point_end_id"], name: "index_edges_on_point_end_id", using: :btree
  add_index "edges", ["point_start_id", "point_end_id"], name: "index_edges_on_point_start_id_and_point_end_id", unique: true, using: :btree
  add_index "edges", ["point_start_id"], name: "index_edges_on_point_start_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "content",      limit: 65535
    t.datetime "start_event"
    t.integer  "event_type",   limit: 4
    t.datetime "finish_event"
    t.integer  "store_id",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "events", ["store_id"], name: "index_events_on_store_id", using: :btree

  create_table "floors", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "commerce_center_id", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "floors", ["commerce_center_id"], name: "index_floors_on_commerce_center_id", using: :btree

  create_table "image_products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "photo",      limit: 255
    t.integer  "product_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "image_products", ["product_id"], name: "index_image_products_on_product_id", using: :btree

  create_table "points", force: :cascade do |t|
    t.integer  "point_type",    limit: 4
    t.string   "name",          limit: 255
    t.decimal  "latitude",                  precision: 10, scale: 6
    t.decimal  "longtitude",                precision: 10, scale: 6
    t.integer  "store_type_id", limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "points", ["store_type_id"], name: "index_points_on_store_type_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.text     "description",       limit: 65535
    t.integer  "quantity",          limit: 4
    t.string   "present_icon",      limit: 255
    t.decimal  "price",                           precision: 10, default: 0
    t.integer  "promotion_percent", limit: 4,                    default: 0
    t.integer  "category_id",       limit: 4
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "followed_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "store_types", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "image",                  limit: 255
    t.string   "current_location_image", limit: 255
    t.integer  "commerce_center_id",     limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "store_types", ["commerce_center_id"], name: "index_store_types_on_commerce_center_id", using: :btree

  create_table "store_users", force: :cascade do |t|
    t.integer  "role",       limit: 4
    t.integer  "store_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "store_users", ["store_id"], name: "index_store_users_on_store_id", using: :btree
  add_index "store_users", ["user_id"], name: "index_store_users_on_user_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "image",         limit: 255
    t.integer  "store_type_id", limit: 4
    t.integer  "floor_id",      limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "stores", ["floor_id"], name: "index_stores_on_floor_id", using: :btree
  add_index "stores", ["store_type_id"], name: "index_stores_on_store_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "full_name",       limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "avatar",          limit: 255
    t.datetime "birth_day"
    t.string   "phone_number",    limit: 255
    t.string   "auth_token",      limit: 255, default: ""
    t.string   "provider",        limit: 255
    t.string   "uid",             limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_foreign_key "categories", "stores"
  add_foreign_key "commerce_centers", "districts"
  add_foreign_key "districts", "provinces"
  add_foreign_key "events", "stores"
  add_foreign_key "floors", "commerce_centers"
  add_foreign_key "image_products", "products"
  add_foreign_key "points", "store_types"
  add_foreign_key "products", "categories"
  add_foreign_key "store_types", "commerce_centers"
  add_foreign_key "store_users", "stores"
  add_foreign_key "store_users", "users"
  add_foreign_key "stores", "floors"
  add_foreign_key "stores", "store_types"
end
