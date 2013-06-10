class ProfileRole < ActiveRecord::Base
  attr_accessible :profile_id, :role_id
  belongs_to :profile
  belongs_to :role
end
