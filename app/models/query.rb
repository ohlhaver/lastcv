class Query < ActiveRecord::Base
  attr_accessible :min_degree, :min_gpa, :min_highest_position_id, 
  :min_highest_salary, :min_salary, :search_term, :subject_id, :latest_availability, :max_salary, :max_notice_period, 
  :top_schools, :min_years, :work_permit_required

  belongs_to :min_highest_position, class_name: "BiomedPosition"


  def get_profiles
      unless search_term == "" || search_term == nil
        @profiles = (Profile.search search_term).select {|i| i.candidate }
        
      else
         @profiles = Profile.all.select {|i| i.candidate }
      end

        @profiles = @profiles.select {|i| i.highest_position != nil && i.highest_position.value >= min_highest_position.value } if min_highest_position 

        @profiles = @profiles.select {|i| i.education_level != nil && i.education_level >= min_degree } if min_degree 

        @profiles = @profiles.select {|i| i.general_min_yearly_salary != nil && i.general_min_yearly_salary <= max_salary } if max_salary

        @profiles = @profiles.select {|i| i.notice_period != nil && i.notice_period <= max_notice_period } if max_notice_period

        @profiles = @profiles.select {|i| i.work_permit == true } if work_permit_required == true

        @profiles = @profiles.sort_by(&:updated_at).reverse

        return @profiles  
      end
end
