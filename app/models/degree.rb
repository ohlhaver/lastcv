class Degree < ActiveRecord::Base
  attr_accessible :gpa, :level, :school_name, :subject_id, :year, :school_id
  belongs_to :subject
  belongs_to :school
  validates_presence_of :level, :year
  validates :gpa, :numericality => { :greater_than => 0, :less_than_or_equal_to => 5 }, :allow_blank => true
end
