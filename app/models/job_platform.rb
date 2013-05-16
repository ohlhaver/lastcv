class JobPlatform < ActiveRecord::Base
  attr_accessible :job_id, :platform_id
  belongs_to :platform
  belongs_to :job
end
