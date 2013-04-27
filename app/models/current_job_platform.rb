class CurrentJobPlatform < ActiveRecord::Base
  attr_accessible :platform_id, :profile_id
  belongs_to :platform
  belongs_to :profile
end
