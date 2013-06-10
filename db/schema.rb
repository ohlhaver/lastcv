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

ActiveRecord::Schema.define(:version => 20130610034122) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "applicants", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.string   "skype_id"
    t.string   "linked_in_url"
    t.integer  "profile_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "approvals", :force => true do |t|
    t.integer  "invitation_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "paid"
  end

  create_table "biomed_positions", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "biomed_skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "biomed_titles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "candidates", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.string   "skype_id"
    t.string   "linkedin_url"
    t.integer  "profile_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "current_job_platforms", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "platform_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "current_job_skills", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "skill_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "degrees", :force => true do |t|
    t.string   "school_name"
    t.integer  "subject_id"
    t.float    "gpa"
    t.integer  "level"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "profile_id"
    t.integer  "year"
    t.integer  "school_id"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "fields", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "institution_tiers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "institutions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "institution_tier_id"
  end

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "candidate_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "job_biomed_skills", :force => true do |t|
    t.integer  "job_id"
    t.integer  "biomed_skill_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "job_platforms", :force => true do |t|
    t.integer  "job_id"
    t.integer  "platform_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "job_skills", :force => true do |t|
    t.integer  "job_id"
    t.integer  "skill_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jobs", :force => true do |t|
    t.integer  "profile_id"
    t.string   "company_name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "contract"
    t.integer  "hourly_salary"
    t.integer  "annual_salary"
    t.integer  "people_led"
    t.integer  "company_size"
    t.integer  "position_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "current"
    t.integer  "team_size"
    t.integer  "biomed_position_id"
    t.integer  "biomed_title_id"
    t.integer  "company_stage_id"
    t.integer  "field_id"
    t.string   "position_name"
    t.integer  "sector_id"
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "platforms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "previous_job_platforms", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "platform_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "previous_job_skills", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "skill_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profile_biomed_skills", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "biomed_skill_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "profile_cities", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profile_languages", :force => true do |t|
    t.integer  "language_id"
    t.integer  "profile_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "value"
  end

  create_table "profile_roles", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.boolean  "full_time"
    t.boolean  "part_time"
    t.integer  "max_part_time_hours"
    t.integer  "min_part_time_hours"
    t.integer  "general_min_yearly_salary"
    t.integer  "general_min_hourly_salary"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "education_level"
    t.boolean  "silicon_valley"
    t.integer  "notice_period"
    t.boolean  "work_permit"
    t.integer  "android_apps"
    t.integer  "ios_apps"
    t.integer  "windows_apps"
    t.boolean  "confirmed"
    t.boolean  "references"
    t.float    "ios_years"
    t.integer  "highest_position_id"
    t.boolean  "biomed"
    t.float    "biomed_years"
    t.integer  "city_id"
    t.boolean  "relocate"
    t.boolean  "silicon_valley_part_time"
    t.float    "android_years"
    t.float    "app_years"
    t.boolean  "help"
    t.boolean  "verified"
    t.integer  "highest_degree_id"
  end

  create_table "queries", :force => true do |t|
    t.string   "search_term"
    t.integer  "max_salary"
    t.integer  "min_degree"
    t.integer  "subject_id"
    t.float    "min_gpa"
    t.integer  "min_highest_position_id"
    t.integer  "min_highest_salary"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "max_notice_period"
    t.boolean  "top_schools"
    t.float    "min_years"
    t.boolean  "work_permit_required"
    t.boolean  "full_time"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sectors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "test_scores", :force => true do |t|
    t.integer  "score"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "test_type"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "company_name"
    t.string   "website"
    t.string   "contact_person"
    t.boolean  "verified"
    t.string   "customer_id"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
