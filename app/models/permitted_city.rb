class PermittedCity < ActiveRecord::Base
  attr_accessible :city_id, :profile_id
  belongs_to :profile
  belongs_to :city
end
