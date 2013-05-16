class Degree < ActiveRecord::Base
  attr_accessible :gpa, :level, :school_name, :subject_id
  belongs_to :subject
end
