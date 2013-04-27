class Query < ActiveRecord::Base
  attr_accessible :cfa, :earliest_availability, :min_company_tier_id, :min_degree, :min_gpa, :min_highest_position_id, :min_highest_salary, :min_institution_tier_id, :min_salary, :min_working_years, :past_company_id, :past_profession_id, :search_term, :subject_id, :targeted_profession_id, :latest_availability, :max_salary
  belongs_to :targeted_profession, class_name: "Profession"
  belongs_to :past_profession, class_name: "Profession"
  belongs_to :past_company, class_name: "Company"
  belongs_to :subject
  belongs_to :min_institution_tier, class_name: "InstitutionTier"
  belongs_to :min_highest_position, class_name: "Position"
  belongs_to :min_company_tier, class_name: "CompanyTier"
end
