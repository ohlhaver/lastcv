class Job < ActiveRecord::Base
  attr_accessible :company_name, :profile_id
  belongs_to :profile
end
