class Profile < ActiveRecord::Base

  attr_accessible :full_time, :max_part_time_hours, :min_hourly_salary, :min_part_time_hours, 
  :part_time, :general_min_yearly_salary, :general_min_hourly_salary, 
  :silicon_valley, :work_permit, :notice_period, :ios_apps, :references, :confirmed, 
  :ios_years, :jobs_attributes, :degrees_attributes, :test_scores_attributes,
  :silicon_valley_part_time, :android_apps, :android_years
  
  has_many :jobs
  has_many :degrees
  has_many :test_scores
  has_one :candidate
  belongs_to :highest_position, class_name: "Position"

  accepts_nested_attributes_for :jobs, :allow_destroy => true
  accepts_nested_attributes_for :degrees, :allow_destroy => true
  accepts_nested_attributes_for :test_scores, :allow_destroy => true

  after_save :generate_education_level
  after_save :generate_highest_position_id
  after_save :generate_ios_years
  after_save :generate_android_years
  after_save :generate_app_years
  validates_presence_of :notice_period, :general_min_yearly_salary, :confirmed
  validates :ios_apps, :numericality => { :greater_than_or_equal => 0, :less_than_or_equal_to => 100 }, :allow_blank => true
  validates :ios_years, :numericality => { :greater_than_or_equal => 0, :less_than_or_equal_to => 20 }, :allow_blank => true
  validates :android_apps, :numericality => { :greater_than_or_equal => 0, :less_than_or_equal_to => 100 }, :allow_blank => true
  validates :android_years, :numericality => { :greater_than_or_equal => 0, :less_than_or_equal_to => 20 }, :allow_blank => true
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

  def generate_ios_years
    ios_d = self.ios_years if self.ios_years
    start_dates = []
    end_dates = []
    if jobs.any?
      jobs.each do |job|
        unless job.platforms.where(:name => "iOS").empty?
          if job.current == true
            end_date = Time.now.to_date
          else
            end_date = job.end_date.to_date
          end
          start_dates += Array.wrap(job.start_date)
          end_dates += Array.wrap(end_date)
        end
      end
      if end_dates.any? && start_dates.any?
      ios_duration = ((((end_dates).max.to_time.to_i - (start_dates).min.to_time.to_i).to_f)/3600/24/365).round(1)
      else
        ios_duration = 0
      end
    else
      ios_duration = 0
    end
    self.ios_years=ios_duration
    if self.ios_years != ios_d
        self.save
    end

  end

  def generate_android_years
    android_d = self.android_years if self.android_years
    start_dates = []
    end_dates = []
    if jobs.any?
      jobs.each do |job|
        unless job.platforms.where(:name => "Android").empty?
          if job.current == true
            end_date = Time.now.to_date
          else
            end_date = job.end_date.to_date
          end
          start_dates += Array.wrap(job.start_date)
          end_dates += Array.wrap(end_date)
        end
      end
      if end_dates.any? && start_dates.any?
        android_duration = ((((end_dates).max.to_time.to_i - (start_dates).min.to_time.to_i).to_f)/3600/24/365).round(1)
      else
        android_duration = 0
      end
    else
      android_duration = 0
    end
    self.android_years=android_duration
    if self.android_years != android_d
        self.save
    end
  end

  def generate_app_years
    app_d = self.app_years if self.app_years
    app_jobs = jobs.select {|i| i.platforms.empty? == false} if jobs
    start_dates = []
    end_dates = []
    if app_jobs.any?
      app_jobs.each do |job|
        
          if job.current == true
            end_date = Time.now.to_date
          else
            end_date = job.end_date.to_date
          end
          start_dates += Array.wrap(job.start_date)
          end_dates += Array.wrap(end_date)
      end
      duration = ((((end_dates).max.to_time.to_i - (start_dates).min.to_time.to_i).to_f)/3600/24/365).round(1)
    else
      duration = 0
    end
    self.app_years = duration
    if self.app_years != app_d
        self.save
    end

  end

end
