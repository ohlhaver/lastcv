class Degree < ActiveRecord::Base
  attr_accessible :gpa, :level, :school_name, :subject_id
  belongs_to :subject
  validates_presence_of :school_name, :level
end
