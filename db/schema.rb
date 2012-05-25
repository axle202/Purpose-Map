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

ActiveRecord::Schema.define(:version => 20120524161848) do

  create_table "common_codes", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ntees", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "ntee_code"
    t.string   "zip_code",                        :default => "", :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "address",                                         :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "ein",                             :default => 0,  :null => false
    t.string   "in_care_of_name"
    t.string   "city",                            :default => "", :null => false
    t.string   "state",                           :default => "", :null => false
    t.integer  "group_exemption_number"
    t.integer  "subsection_code"
    t.integer  "affiliation_code"
    t.integer  "classification_code"
    t.date     "ruling_date"
    t.integer  "deductibility_code"
    t.integer  "foundation_code"
    t.integer  "activity_code"
    t.integer  "organization_code"
    t.integer  "exempt_organization_status_code"
    t.date     "advanced_ruling_expiration_date"
    t.integer  "tax_period"
    t.integer  "asset_code"
    t.integer  "income_code"
    t.integer  "filing_requirement_code"
    t.integer  "pf_filing_requirement_code"
    t.integer  "accounting_period"
    t.float    "asset_amount"
    t.float    "income_amount"
    t.float    "form_990_revenue_amount"
    t.string   "sort_or_secondary_name"
  end

  add_index "organizations", ["ein"], :name => "index_organizations_on_ein", :unique => true

end
