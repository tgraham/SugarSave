# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100606032910) do

  create_table "charities", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "city_id"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "search_name"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.integer  "zip_code"
    t.string   "address"
  end

  create_table "deals", :force => true do |t|
    t.string   "name"
    t.integer  "regular_price"
    t.integer  "initial_discount"
    t.integer  "max_discount"
    t.integer  "max_threshold"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.integer  "company_id"
    t.boolean  "approved"
    t.date     "deal_date"
    t.string   "photo_file_name"
    t.string   "blurb_title"
    t.text     "blurb"
    t.boolean  "weekend"
    t.string   "deal_type"
    t.integer  "tipping_point"
    t.date     "end_date"
  end

  create_table "fine_prints", :force => true do |t|
    t.string   "description"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "highlights", :force => true do |t|
    t.string   "description"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommendations", :force => true do |t|
    t.string   "from_email"
    t.string   "to_email"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deal_id"
    t.string   "name"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbreviation"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.integer  "city_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "perishable_token",  :default => "", :null => false
  end

  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
