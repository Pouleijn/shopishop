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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120731184225) do

  create_table "assets", :force => true do |t|
    t.integer  "asset_able_id"
    t.string   "asset_able_type"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.integer  "position"
    t.string   "name",         :limit => 20,                    :null => false
    t.boolean  "published",                  :default => false
    t.integer  "labels_count",               :default => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "employees", :force => true do |t|
    t.string   "first_name", :limit => 30,                       :null => false
    t.string   "last_name",  :limit => 50,                       :null => false
    t.string   "gender",     :limit => 10
    t.date     "birthday"
    t.text     "bio"
    t.string   "role",       :limit => 10, :default => "seller", :null => false
    t.integer  "user_id",                                        :null => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "employees", ["user_id"], :name => "index_employees_on_user_id"

  create_table "labelizations", :force => true do |t|
    t.integer "category_id"
    t.integer "label_id"
  end

  add_index "labelizations", ["category_id", "label_id"], :name => "index_labelizations_on_category_id_and_label_id", :unique => true

  create_table "labels", :force => true do |t|
    t.string   "name",       :limit => 20, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "labels", ["name"], :name => "index_labels_on_name", :unique => true

  create_table "product_questions", :force => true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name",            :limit => 20,                                                :null => false
    t.text     "description"
    t.decimal  "unit_price",                    :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "sales_price",                   :precision => 8, :scale => 2, :default => 0.0
    t.date     "published_at",                                                                 :null => false
    t.date     "published_until"
    t.datetime "deleted_at"
    t.integer  "category_id",                                                                  :null => false
    t.integer  "label_id",                                                                     :null => false
    t.datetime "created_at",                                                                   :null => false
    t.datetime "updated_at",                                                                   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
