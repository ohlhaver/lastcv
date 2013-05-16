class JobSkill < ActiveRecord::Base
  attr_accessible :job_id, :skill_id
  belongs_to :skill
  belongs_to :job
end
