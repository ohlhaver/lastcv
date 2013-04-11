class City < ActiveRecord::Base
  attr_accessible :name
  has_many :acceptable_cities, class_name: "City"
  has_many :permitted_cities, class_name: "City"
end
