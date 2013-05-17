class Profile < ActiveRecord::Base

  attr_accessible :act_composite, :act_english, :act_math, :act_reading, :act_science, :applicant_id, 
  :full_time, :highschool_name, :max_part_time_hours, :min_hourly_salary, :min_part_time_hours, :part_time, 
  :percentile_in_highschool, :ranking_in_highschool, :sat_critical_reading, :sat_math,
  :sat_total_new, :sat_total_old, :sat_writing, :profession_ids, :cfa, :general_min_yearly_salary, :general_min_hourly_salary, 
  :latest_job_company_id, :latest_job_position_id, :latest_job_start_date, :latest_job_end_date, :latest_job_current, 
  :previous_job_position_id, :previous_job_start_date, :previous_job_end_date, 
  :postgrad_institution_id, :postgrad_subject_id, :postgrad_gpa, :grad_institution_id, :grad_subject_id, 
  :grad_gpa, :undergrad_institution_id, :undergrad_subject_id, :undergrad_gpa, :language_ids, :postgrad_degree, :grad_degree,
  :undergrad_degree, :highschool_diploma, :silicon_valley, :work_permit, :notice_period, :current_platform_ids, :current_skill_ids, :latest_job_contract, 
  :latest_job_annual_salary, :latest_job_hourly_salary, :previous_platform_ids, :previous_skill_ids, :previous_job_contract, 
  :previous_job_annual_salary, :previous_job_hourly_salary, :latest_job_company_name, :latest_job_company_size, :previous_job_company_name, 
  :previous_job_company_size, :postgrad_number_of_recommendations, :ios_apps, :references, :confirmed, 
  :latest_job_team_size, :previous_job_team_size, :ios_years, :jobs_attributes, :degrees_attributes, :test_scores_attributes
  
  has_many :jobs
  has_many :degrees
  has_many :test_scores
  has_one :candidate
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

  accepts_nested_attributes_for :jobs, :allow_destroy => true
  accepts_nested_attributes_for :degrees, :allow_destroy => true
  accepts_nested_attributes_for :test_scores, :allow_destroy => true

  after_save :generate_education_level
  after_save :generate_highest_position_id
  validates_presence_of :silicon_valley, :notice_period, :general_min_yearly_salary, :confirmed, :ios_years

  define_index do
    indexes jobs.position.name, :as => :jobs_position_name
    indexes jobs.platforms.name, :as => :jobs_platforms_name
    indexes jobs.skills.name, :as => :jobs_skills_name
    indexes jobs.company_name, :as => :jobs_company_name
    indexes degrees.school_name, :as => :degress_school_name
    indexes degrees.subject.name, :as => :degrees_subject_name
  end



  def generate_education_level
      el = self.education_level
      self.education_level = 0
      degrees.each do |degree|
        self.education_level = degree.level if degree.level > self.education_level
      end

      if self.education_level != el
        self.save
      end
   end

  def generate_highest_position_id
    
      hp = self.highest_position_id
      if jobs.any?

        self.highest_position_id = jobs.first.position_id
        jobs.each do |job|

          self.highest_position_id = job.position_id unless job.position.value < Position.find(self.highest_position_id).value
        end
      else

      self.highest_position_id = nil
      end

      if self.highest_position_id != hp
        self.save
      end
    

  end

  def skills
    return (current_skills + previous_skills).uniq
  end

  def platforms
    platforms =[]
    jobs.each do |job|
      platforms += job.platforms
    end

    return platforms.uniq
  end

  def highest_hourly_salary 
      return [latest_job_hourly_salary, previous_job_hourly_salary].max
  end


  def highest_annual_salary
      return [latest_job_annual_salary, previous_job_annual_salary].max
  end

end
