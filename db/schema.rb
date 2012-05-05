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

ActiveRecord::Schema.define(:version => 20120430141000) do

  create_table "categories", :force => true do |t|
    t.integer  "position"
    t.string   "name",         :limit => 20
    t.boolean  "published",                  :default => false
    t.integer  "labels_count",               :default => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "employees", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender",     :limit => 10
    t.date     "birthday"
    t.text     "bio"
    t.string   "role",       :limit => 10, :default => "seller"
    t.integer  "user_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "employees", ["user_id"], :name => "index_employees_on_user_id"

  create_table "labelizations", :force => true do |t|
    t.integer  "category_id"
    t.integer  "label_id"
    t.integer  "position"
    t.boolean  "published",   :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "labelizations", ["category_id", "label_id"], :name => "index_labelizations_on_category_id_and_label_id", :unique => true
  add_index "labelizations", ["position"], :name => "index_labelizations_on_position"
  add_index "labelizations", ["published"], :name => "index_labelizations_on_published"

  create_table "labels", :force => true do |t|
    t.string   "name",       :limit => 20
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "labels", ["name"], :name => "index_labels_on_name", :unique => true

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "unit_price"
    t.decimal  "sales_price"
    t.datetime "published_at"
    t.datetime "published_until"
    t.datetime "deleted_at"
    t.integer  "category_id"
    t.integer  "label_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
