class Degree < ActiveRecord::Base
  attr_accessible :gpa, :level, :school_name, :subject_id
  belongs_to :subject
  validates_presence_of :school_name, :level
  validates :gpa, :numericality => { :greater_than => 0, :less_than_or_equal_to => 5 }, :allow_blank => true
end
