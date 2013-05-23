class JobBiomedSkill < ActiveRecord::Base
  attr_accessible :biomed_skill_id, :job_id
  belongs_to :biomed_skill
  belongs_to :job
end
