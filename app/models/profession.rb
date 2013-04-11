class Profession < ActiveRecord::Base
  attr_accessible :name
  has_many :targeted_professions
  has_many :profiles, through: :targeted_professions
end
