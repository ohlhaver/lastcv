class TargetedProfession < ActiveRecord::Base
  attr_accessible :min_hourly_salary, :min_yearly_salary, :profession_id, :profile_id
  belongs_to :profile
  belongs_to :profession
end
