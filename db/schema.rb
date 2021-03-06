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

ActiveRecord::Schema.define(version: 2019_12_29_103230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_posts", id: false, force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "category_id", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "email"
    t.string "name"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "company_details", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "phone"
    t.string "email"
    t.string "business_name"
    t.integer "org_no"
    t.string "address"
    t.string "zip_code"
    t.string "established"
    t.string "referral"
    t.boolean "gender"
    t.bigint "order_id"
    t.bigint "single_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_company_details_on_order_id"
    t.index ["single_order_id"], name: "index_company_details_on_single_order_id"
  end

  create_table "contact_mailers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "header"
    t.text "description"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_notes", force: :cascade do |t|
    t.text "description"
    t.bigint "order_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_notes_on_order_id"
    t.index ["user_id"], name: "index_order_notes_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "logo_name"
    t.string "slogan"
    t.string "industry_id"
    t.string "color"
    t.string "reference_logo"
    t.boolean "active"
    t.string "style_id"
    t.string "package_id"
    t.integer "total"
    t.string "package_name"
    t.text "product_array"
    t.text "service_array"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders_products", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.index ["order_id", "product_id"], name: "index_orders_products_on_order_id_and_product_id"
  end

  create_table "package_products", force: :cascade do |t|
    t.bigint "package_id"
    t.bigint "product_id"
    t.index ["package_id"], name: "index_package_products_on_package_id"
    t.index ["product_id"], name: "index_package_products_on_product_id"
  end

  create_table "package_services", force: :cascade do |t|
    t.bigint "package_id"
    t.bigint "service_id"
    t.index ["package_id"], name: "index_package_services_on_package_id"
    t.index ["service_id"], name: "index_package_services_on_service_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "preface"
    t.text "body"
    t.string "thumbnail"
    t.string "slug"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.string "photo"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "single_order_notes", force: :cascade do |t|
    t.text "description"
    t.bigint "single_order_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["single_order_id"], name: "index_single_order_notes_on_single_order_id"
    t.index ["user_id"], name: "index_single_order_notes_on_user_id"
  end

  create_table "single_orders", force: :cascade do |t|
    t.string "design"
    t.integer "total"
    t.boolean "active"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_single_orders_on_product_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "user_id"
    t.text "description"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "business_name"
    t.integer "org_no"
    t.string "address"
    t.integer "established"
    t.string "referral"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "company_details", "orders"
  add_foreign_key "company_details", "single_orders"
  add_foreign_key "order_notes", "orders"
  add_foreign_key "order_notes", "users"
  add_foreign_key "package_products", "packages"
  add_foreign_key "package_products", "products"
  add_foreign_key "package_services", "packages"
  add_foreign_key "package_services", "services"
  add_foreign_key "posts", "users"
  add_foreign_key "single_order_notes", "single_orders"
  add_foreign_key "single_order_notes", "users"
  add_foreign_key "single_orders", "products"
  add_foreign_key "tasks", "users"
end
