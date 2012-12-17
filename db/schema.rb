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

ActiveRecord::Schema.define(:version => 20121216185314) do

  create_table "allergies", :force => true do |t|
    t.integer  "person_id"
    t.string   "allergen"
    t.string   "type"
    t.string   "reaction"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "person_id"
    t.string   "postal_code",     :limit => 5
    t.string   "region"
    t.string   "city"
    t.text     "address"
    t.string   "description"
    t.string   "phone_number",    :limit => 20
    t.text     "comment"
    t.boolean  "is_registration"
    t.boolean  "is_residence"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "medications", :force => true do |t|
    t.integer  "person_id"
    t.string   "name"
    t.string   "type"
    t.string   "dose"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "family_name"
    t.string   "given_name"
    t.string   "middle_name"
    t.date     "birth_date"
    t.boolean  "gender"
    t.integer  "tax_num"
    t.integer  "cell_num"
    t.integer  "blood_type"
    t.boolean  "rh_factor"
    t.text     "additional_details"
    t.integer  "clinic_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
