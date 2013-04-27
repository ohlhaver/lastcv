class PreviousJobSkill < ActiveRecord::Base
  attr_accessible :platform_id, :profile_id
  belongs_to :skill
  belongs_to :profile
end
