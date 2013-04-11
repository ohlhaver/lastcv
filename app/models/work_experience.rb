class WorkExperience < ActiveRecord::Base
  attr_accessible :company_id, :end_date, :highest_position_id, :highest_salary, :number_of_recommendations, 
  :profession_id, :profile_id, :project_keywords, :start_date, :highest_yearly_salary
  belongs_to :company
  belongs_to :profile
  belongs_to :profession
  belongs_to :highest_position, class_name: "Position"
end
