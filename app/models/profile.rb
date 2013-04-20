class Profile < ActiveRecord::Base
  attr_accessible :act_composite, :act_english, :act_math, :act_reading, :act_science, :applicant_id, :earliest_start_date, 
  :full_time, :gmat, :highschool_name, :lsat, :max_part_time_hours, :min_hourly_salary, :min_part_time_hours, :min_yearly_salary, 
  :part_time, :percentile_in_highschool, :ranking_in_highschool, :recommendations_in_highschool, :sat_critical_reading, :sat_math,
  :sat_total_new, :sat_total_old, :sat_writing, :profession_ids, :cfa, :general_min_yearly_salary, :general_min_hourly_salary, 
  :a_city_ids, :p_city_ids, :latest_job_profession_id, :latest_job_company_id, :latest_job_position_id, :latest_job_salary, 
  :latest_job_number_of_recommendations, :latest_job_start_date, :latest_job_end_date, :latest_job_current, :latest_job_project_keywords, 
  :previous_job_profession_id, :previous_job_company_id, :previous_job_position_id, :previous_job_salary, 
  :previous_job_number_of_recommendations, :previous_job_start_date, :previous_job_end_date, :previous_job_project_keywords, 
  :postgrad_institution_id, :postgrad_subject_id, :postgrad_gpa, :postgrad_number_of_recommendations, :grad_institution_id, :grad_subject_id, 
  :grad_gpa, :grad_number_of_recommendations, :undergrad_institution_id, :undergrad_subject_id, :undergrad_gpa, 
  :undergrad_number_of_recommendations, :language_ids, :postgrad_degree, :grad_degree, :undergrad_degree, :highschool_diploma

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
