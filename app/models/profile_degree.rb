class ProfileDegree < ActiveRecord::Base
  attr_accessible :college_subject_id, :gpa, :graduation_date, :number_of_recommendations, :profile_id, :school_id
end
