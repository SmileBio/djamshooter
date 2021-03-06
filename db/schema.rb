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

ActiveRecord::Schema.define(version: 20170703120440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adverts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "price",       default: "Договорная"
    t.integer  "region_id"
    t.integer  "city_id"
    t.index ["city_id"], name: "index_adverts_on_city_id", using: :btree
    t.index ["region_id"], name: "index_adverts_on_region_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "parent_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "categories_merchant_pages", id: false, force: :cascade do |t|
    t.integer "category_id",      null: false
    t.integer "merchant_page_id", null: false
    t.index ["category_id", "merchant_page_id"], name: "category_merchant_page", unique: true, using: :btree
    t.index ["merchant_page_id", "category_id"], name: "merchant_page_category", unique: true, using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "title",      limit: 70
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "region_id"
    t.index ["region_id"], name: "index_cities_on_region_id", using: :btree
  end

  create_table "cities_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "city_id", null: false
    t.index ["city_id"], name: "index_cities_users_on_city_id", using: :btree
    t.index ["user_id"], name: "index_cities_users_on_user_id", using: :btree
  end

  create_table "galeries", force: :cascade do |t|
    t.string   "title"
    t.integer  "merchant_page_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["merchant_page_id"], name: "index_galeries_on_merchant_page_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.string   "image"
    t.integer  "galery_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["galery_id"], name: "index_images_on_galery_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "merchant_page_id"
    t.integer  "city_id"
    t.integer  "region_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["city_id"], name: "index_locations_on_city_id", using: :btree
    t.index ["merchant_page_id"], name: "index_locations_on_merchant_page_id", using: :btree
    t.index ["region_id"], name: "index_locations_on_region_id", using: :btree
  end

  create_table "merchant_pages", force: :cascade do |t|
    t.string   "company_name"
    t.text     "description"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "company_logo_file_name"
    t.string   "company_logo_content_type"
    t.integer  "company_logo_file_size"
    t.datetime "company_logo_updated_at"
    t.boolean  "approved"
  end

  create_table "merchant_services", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "service_id"
    t.decimal  "price",      precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "title",      limit: 70
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "measure"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "user_roles",             default: "user"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "region_id"
    t.string   "phone"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["region_id"], name: "index_users_on_region_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "adverts", "cities"
  add_foreign_key "adverts", "regions"
  add_foreign_key "cities", "regions"
  add_foreign_key "users", "regions"
end
