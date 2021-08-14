# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_810_200_857) do
  create_table 'addresses', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'property_id'
    t.string 'line_one'
    t.string 'line_two'
    t.string 'city'
    t.string 'post_code'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['property_id'], name: 'index_addresses_on_property_id', unique: true
    t.index ['user_id'], name: 'index_addresses_on_user_id', unique: true
  end

  create_table 'properties', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'beds'
    t.string 'amenities'
    t.integer 'min_stay'
    t.integer 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_properties_on_user_id', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.integer 'mobile'
    t.boolean 'is_host', default: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'addresses', 'properties'
  add_foreign_key 'addresses', 'users'
  add_foreign_key 'properties', 'users'
end
