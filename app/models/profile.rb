class Profile < ActiveRecord::Base

  attr_accessible :full_time, :max_part_time_hours, :min_hourly_salary, :min_part_time_hours, 
  :part_time, :general_min_yearly_salary, :general_min_hourly_salary, 
  :silicon_valley, :work_permit, :notice_period, :ios_apps, :references, :confirmed, 
  :ios_years, :jobs_attributes, :degrees_attributes, :test_scores_attributes, :biomed_years, :city_id

  has_many :jobs
  has_many :degrees
  has_many :test_scores
  has_one :candidate
  belongs_to :highest_position, class_name: "BiomedPosition"
  belongs_to :city

  accepts_nested_attributes_for :jobs, :allow_destroy => true
  accepts_nested_attributes_for :degrees, :allow_destroy => true
  accepts_nested_attributes_for :test_scores, :allow_destroy => true

  after_save :generate_education_level
  after_save :generate_highest_position_id
  validates_presence_of :notice_period, :general_min_yearly_salary, :confirmed, :biomed_years
  validates :ios_apps, :numericality => { :greater_than_or_equal => 0, :less_than_or_equal_to => 100 }, :allow_blank => true
  validates :biomed_years, :numericality => { :greater_than_or_equal => 0, :less_than_or_equal_to => 7 }
  validates :notice_period, :numericality => { :greater_than_or_equal => 0, :less_than_or_equal_to => 52 }
  validates :general_min_yearly_salary, :numericality => { :greater_than => 0}

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

        self.highest_position_id = jobs.first.biomed_position_id
        jobs.each do |job|

          self.highest_position_id = job.biomed_position_id unless job.biomed_position.value < BiomedPosition.find(self.highest_position_id).value
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
