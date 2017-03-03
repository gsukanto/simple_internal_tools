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

ActiveRecord::Schema.define(version: 20170303065432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cashtag_availables", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.string   "cashtag"
    t.string   "old_cashtag"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "end_flag_statuses", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "image_status_requests", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.string   "ktp"
    t.string   "avatar"
    t.string   "signatur"
    t.string   "tax_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "otp_preloads", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.string   "error_code"
    t.string   "error_message"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "otps", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.string   "sms_otp"
    t.string   "valid"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "service_settings", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_settings", ["deleted_at"], name: "index_service_settings_on_deleted_at", using: :btree
  add_index "service_settings", ["name"], name: "index_service_settings_on_name", using: :btree

  create_table "sms_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "message_masking_rules"
    t.string   "message_masking_string"
    t.datetime "deleted_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sms_provider_presets", force: :cascade do |t|
    t.string   "name"
    t.text     "curl_request_template"
    t.integer  "timeout_in_second"
    t.integer  "time_to_complete_in_second"
    t.integer  "retried"
    t.integer  "priority"
    t.string   "error_check_xpath"
    t.string   "request_type"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "deleted_at"
  end

  add_index "sms_provider_presets", ["deleted_at"], name: "index_sms_provider_presets_on_deleted_at", using: :btree

  create_table "sms_provider_trackers", force: :cascade do |t|
    t.string   "job_id"
    t.string   "sms_to"
    t.string   "sms_from"
    t.string   "sms_message"
    t.string   "sms_content_hash"
    t.integer  "job_status"
    t.string   "queue_name"
    t.text     "response_data"
    t.integer  "response_status"
    t.integer  "real_response_time"
    t.integer  "retry_count"
    t.datetime "recorded_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "sms_provider_preset_id"
    t.datetime "deleted_at"
    t.jsonb    "dc_data"
    t.string   "curl_cmd"
    t.integer  "sms_category_id"
  end

  add_index "sms_provider_trackers", ["deleted_at"], name: "index_sms_provider_trackers_on_deleted_at", using: :btree
  add_index "sms_provider_trackers", ["sms_category_id"], name: "index_sms_provider_trackers_on_sms_category_id", using: :btree
  add_index "sms_provider_trackers", ["sms_provider_preset_id"], name: "index_sms_provider_trackers_on_sms_provider_preset_id", using: :btree

  create_table "step_1_preloads", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "step_1s", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "step_3_preloads", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "step_3s", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.date     "birthday"
    t.string   "birth_place"
    t.string   "cashtag"
    t.string   "gender"
    t.date     "id_card_expire_date"
    t.integer  "id_card_number"
    t.boolean  "is_nationality_id_valid_for_life"
    t.string   "job"
    t.string   "marital_status"
    t.string   "name"
    t.string   "name_on_card"
    t.string   "nationality"
    t.string   "nickname"
    t.integer  "tax_id_number"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "step_4_preloads", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "step_4s", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "district"
    t.string   "mailing_address_line_1"
    t.string   "mailing_address_line_2"
    t.string   "mailing_city"
    t.string   "mailing_district"
    t.string   "mailing_province"
    t.string   "mailing_subdistrict"
    t.string   "mailing_zipcode"
    t.string   "provinceLstring"
    t.string   "subdistrict"
    t.string   "use_as_mailing_address"
    t.integer  "zipcode"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "step_5_preloads", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.string   "password"
    t.integer  "pin"
    t.string   "security_answer"
    t.string   "security_question"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "step_6_preloads", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "step_6s", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.string   "account_purpose"
    t.string   "avg_transaction"
    t.string   "duns_source"
    t.string   "income_range"
    t.string   "industry"
    t.string   "job_title"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "success_screen_preloads", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.integer  "account_number"
    t.string   "name_on_card"
    t.string   "cashtag"
    t.string   "nickname"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "upload_image_avatars", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.integer  "customer_id"
    t.string   "image_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "upload_image_ktps", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.integer  "customer_id"
    t.string   "image_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "upload_image_signatures", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.integer  "customer_id"
    t.string   "image_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "upload_image_tax_ids", force: :cascade do |t|
    t.string   "uber_driver_id"
    t.string   "token_id"
    t.boolean  "is_success"
    t.text     "response_data"
    t.integer  "customer_id"
    t.string   "image_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "sms_provider_trackers", "sms_categories"
  add_foreign_key "sms_provider_trackers", "sms_provider_presets"
end
