class JobPlatform < ActiveRecord::Base
  attr_accessible :last_job, :platform_id, :previous_job, :profile_id
end
