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

ActiveRecord::Schema.define(:version => 20130411143521) do

  create_table "acceptable_cities", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "institutions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "permitted_cities", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profession_positions", :force => true do |t|
    t.integer  "profession_id"
    t.integer  "position_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "professions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profile_degrees", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "school_id"
    t.integer  "college_subject_id"
    t.integer  "gpa"
    t.integer  "number_of_recommendations"
    t.date     "graduation_date"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "profile_languages", :force => true do |t|
    t.integer  "language_id"
    t.integer  "profile_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "value"
  end

  create_table "profiles", :force => true do |t|
    t.date     "earliest_start_date"
    t.boolean  "full_time"
    t.boolean  "part_time"
    t.integer  "max_part_time_hours"
    t.integer  "min_part_time_hours"
    t.integer  "sat_math"
    t.integer  "sat_critical_reading"
    t.integer  "sat_writing"
    t.integer  "sat_total_old"
    t.integer  "sat_total_new"
    t.integer  "act_english"
    t.integer  "act_math"
    t.integer  "act_reading"
    t.integer  "act_science"
    t.integer  "act_composite"
    t.integer  "gmat"
    t.integer  "lsat"
    t.integer  "general_min_yearly_salary"
    t.integer  "general_min_hourly_salary"
    t.string   "highschool_name"
    t.integer  "ranking_in_highschool"
    t.integer  "percentile_in_highschool"
    t.integer  "recommendations_in_highschool"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "cfa"
    t.integer  "undergrad_institution_id"
    t.integer  "undergrad_subject_id"
    t.integer  "undergrad_gpa"
    t.integer  "grad_institution_id"
    t.integer  "grad_subject_id"
    t.integer  "grad_gpa"
    t.integer  "postgrad_institution_id"
    t.integer  "postgrad_subject_id"
    t.integer  "postgrad_gpa"
    t.integer  "undergrad_number_of_recommendations"
    t.integer  "grad_number_of_recommendations"
    t.integer  "postgrad_number_of_recommendations"
    t.integer  "latest_job_company_id"
    t.integer  "latest_job_profession_id"
    t.integer  "latest_job_position_id"
    t.integer  "latest_job_salary"
    t.integer  "latest_job_number_of_recommendations"
    t.date     "latest_job_start_date"
    t.date     "latest_job_end_date"
    t.boolean  "latest_job_current"
    t.string   "latest_job_project_keywords"
    t.integer  "previous_job_company_id"
    t.integer  "previous_job_profession_id"
    t.integer  "previous_job_position_id"
    t.integer  "previous_job_salary"
    t.integer  "previous_job_number_of_recommendations"
    t.date     "previous_job_start_date"
    t.date     "previous_job_end_date"
    t.string   "previous_job_project_keywords"
  end

  create_table "school_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schools", :force => true do |t|
    t.integer  "institution_id"
    t.integer  "school_type_id"
    t.integer  "subject_id"
    t.integer  "value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "name"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "targeted_professions", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "profession_id"
    t.integer  "min_yearly_salary"
    t.integer  "min_hourly_salary"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "work_experiences", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "company_id"
    t.integer  "profession_id"
    t.integer  "highest_position_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "number_of_recommendations"
    t.integer  "highest_yearly_salary"
    t.string   "project_keywords"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
