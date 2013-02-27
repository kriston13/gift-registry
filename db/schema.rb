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

ActiveRecord::Schema.define(:version => 20130227125853) do

  create_table "attr_names", :force => true do |t|
    t.string   "description"
    t.string   "value_type"
    t.boolean  "link"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "item_attr_vals", :force => true do |t|
    t.integer  "registry_item_id"
    t.integer  "attr_name_id"
    t.string   "raw_value"
    t.string   "string_val"
    t.float    "float_val"
    t.integer  "int_val"
    t.boolean  "bool_val"
    t.datetime "datetime_val"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "registries", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.date     "startdate"
    t.date     "enddate"
    t.boolean  "public"
    t.integer  "interest_interval"
    t.integer  "max_interest"
    t.integer  "owner_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "registry_items", :force => true do |t|
    t.integer  "registry_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "enabled"
    t.datetime "lastlogin"
    t.integer  "attempts"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
