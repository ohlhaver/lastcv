class CurrentJobSkill < ActiveRecord::Base
  attr_accessible :profile_id, :skill_id
  belongs_to :skill
  belongs_to :profile
end
