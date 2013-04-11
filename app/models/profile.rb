class Profile < ActiveRecord::Base
  attr_accessible :act_composite, :act_english, :act_math, :act_reading, :act_science, :applicant_id, :earliest_start_date, :full_time, :gmat, :highschool_name, :lsat, :max_part_time_hours, :min_hourly_salary, :min_part_time_hours, :min_yearly_salary, :part_time, :percentile_in_highschool, :ranking_in_highschool, :recommendations_in_highschool, :sat_critical_reading, :sat_math,
   :sat_total_new, :sat_total_old, :sat_writing, :profession_ids, :cfa, :general_min_yearly_salary, :general_min_hourly_salary
  has_many :targeted_professions
  has_many :professions, through: :targeted_professions
  has_many :profile_languages
  has_many :languages, through: :profile_languages

  has_many :acceptable_cities
  has_many :permitted_cities
  has_many :a_cities, through: :acceptable_cities, source: :city
  has_many :p_cities, through: :permitted_cities, source: :city


  belongs_to :undergrad_institution, class_name: "Institution"
  belongs_to :undergrad_subject, class_name: "Subject"
  belongs_to :grad_institution, class_name: "Institution"
  belongs_to :grad_subject, class_name: "Subject"
  belongs_to :postgrad_institution, class_name: "Institution"
  belongs_to :postgrad_subject, class_name: "Subject"

  belongs_to :latest_job_company, class_name: "Company"
  belongs_to :latest_job_profession, class_name: "Profession"
  belongs_to :latest_job_position, class_name: "Position"
  belongs_to :previous_job_company, class_name: "Company"
  belongs_to :previous_job_profession, class_name: "Profession"
  belongs_to :previous_job_position, class_name: "Position"

end
