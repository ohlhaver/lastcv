class Query < ActiveRecord::Base
  attr_accessible :min_degree, :min_gpa, :min_highest_position_id, 
  :min_highest_salary, :min_salary, :search_term, :subject_id, :latest_availability, :max_salary, :max_notice_period, 
  :top_schools, :min_years
  belongs_to :targeted_profession, class_name: "Profession"
  belongs_to :past_profession, class_name: "Profession"
  belongs_to :past_company, class_name: "Company"
  belongs_to :subject
  belongs_to :min_institution_tier, class_name: "InstitutionTier"
  belongs_to :min_highest_position, class_name: "Position"
  belongs_to :min_company_tier, class_name: "CompanyTier"
end
