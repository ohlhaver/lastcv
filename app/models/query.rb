class Query < ActiveRecord::Base
  attr_accessible :cfa, :earliest_availability, :min_company_tier_id, :min_degree, :min_gpa, :min_highest_position_id, :min_highest_salary, :min_institution_tier_id, :min_salary, :min_working_years, :past_company_id, :past_profession_id, :search_term, :subject_id, :targeted_profession_id
end
