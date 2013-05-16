class Job < ActiveRecord::Base
  attr_accessible :company_name, :profile_id, :company_size, :contract, :hourly_salary, :annual_salary, 
  :people_led, :position_id, :start_date, :end_date, :current, :team_size, :platform_ids, :skill_ids
  belongs_to :profile
  belongs_to :position
  has_many :job_skills
  has_many :skills, through: :job_skills, source: :skill
  has_many :job_platforms
  has_many :platforms, through: :job_platforms, source: :platform

end
