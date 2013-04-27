class Profile < ActiveRecord::Base
  attr_accessible :act_composite, :act_english, :act_math, :act_reading, :act_science, :applicant_id, 
  :full_time, :highschool_name, :max_part_time_hours, :min_hourly_salary, :min_part_time_hours, :part_time, 
  :percentile_in_highschool, :ranking_in_highschool, :sat_critical_reading, :sat_math,
  :sat_total_new, :sat_total_old, :sat_writing, :profession_ids, :cfa, :general_min_yearly_salary, :general_min_hourly_salary, 
  :latest_job_company_id, :latest_job_position_id, 
  :latest_job_start_date, :latest_job_end_date, :latest_job_current, :previous_job_position_id, :previous_job_start_date, :previous_job_end_date, 
  :postgrad_institution_id, :postgrad_subject_id, :postgrad_gpa, :grad_institution_id, :grad_subject_id, 
  :grad_gpa, :undergrad_institution_id, :undergrad_subject_id, :undergrad_gpa, :language_ids, :postgrad_degree, :grad_degree, :undergrad_degree, :highschool_diploma,
  :silicon_valley, :work_permit, :notice_period, :current_platform_ids, :current_skill_ids, :latest_job_contract, 
  :latest_job_annual_salary, :latest_job_hourly_salary, :previous_platform_ids, :previous_skill_ids, :previous_job_contract, 
  :previous_job_annual_salary, :previous_job_hourly_salary, :latest_job_company_name, :latest_job_company_size, :previous_job_company_name, 
  :previous_job_company_size, :postgrad_number_of_recommendations, :ios_apps


  has_many :profile_languages
  has_many :languages, through: :profile_languages
  has_many :current_job_platforms
  has_many :previous_job_platforms
  has_many :current_job_skills
  has_many :previous_job_skills

  has_many :current_platforms, through: :current_job_platforms, source: :platform
  has_many :current_skills, through: :current_job_skills, source: :skill
  has_many :previous_platforms, through: :previous_job_platforms, source: :platform
  has_many :previous_skills, through: :previous_job_skills, source: :skill


  belongs_to :undergrad_institution, class_name: "Institution"
  belongs_to :undergrad_subject, class_name: "Subject"
  belongs_to :grad_institution, class_name: "Institution"
  belongs_to :grad_subject, class_name: "Subject"
  belongs_to :postgrad_institution, class_name: "Institution"
  belongs_to :postgrad_subject, class_name: "Subject"
  belongs_to :latest_job_position, class_name: "Position"
  belongs_to :previous_job_position, class_name: "Position"


  after_save :generate_education_level

  def generate_education_level
      el = self.education_level
      if postgrad_degree == true
        self.education_level = 4
      elsif grad_degree == true
        self.education_level = 3
      elsif undergrad_degree == true
        self.education_level = 2 
      elsif highschool_diploma == true
        self.education_level = 1
      else
        self.education_level = 0
      end

      if self.education_level != el
        self.save
      end
   end



end
