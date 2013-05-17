class ChangeFieldsinProfile < ActiveRecord::Migration
	def change
	    remove_column :profiles, :latest_job_contract
	    remove_column :profiles, :previous_job_contract
	    remove_column :profiles, :latest_job_hourly_salary
	    remove_column :profiles, :previous_job_hourly_salary
	    remove_column :profiles, :latest_job_annual_salary
	    remove_column :profiles, :previous_job_annual_salary
	    remove_column :profiles, :latest_job_people_led
	    remove_column :profiles, :previous_job_people_led
	    remove_column :profiles, :latest_job_company_size
	    remove_column :profiles, :previous_job_company_size
	    remove_column :profiles, :latest_job_company_name
	    remove_column :profiles, :previous_job_company_name 
	    remove_column :profiles, :sat_math
	    remove_column :profiles, :sat_critical_reading
	    remove_column :profiles, :sat_writing
	    remove_column :profiles, :sat_total_old
	    remove_column :profiles, :sat_total_new
	    remove_column :profiles, :act_english
	    remove_column :profiles, :act_math
	    remove_column :profiles, :act_reading
	    remove_column :profiles, :act_science
	    remove_column :profiles, :act_composite
	    remove_column :profiles, :highschool_name
	    remove_column :profiles, :ranking_in_highschool
	    remove_column :profiles, :percentile_in_highschool
	    remove_column :profiles, :recommendations_in_highschool
	    remove_column :profiles, :undergrad_institution_id
	    remove_column :profiles, :undergrad_subject_id
	    remove_column :profiles, :undergrad_gpa
	    remove_column :profiles, :grad_institution_id
	    remove_column :profiles, :grad_subject_id
	    remove_column :profiles, :grad_gpa
	    remove_column :profiles, :postgrad_institution_id
	    remove_column :profiles, :postgrad_subject_id
	    remove_column :profiles, :postgrad_gpa
	    remove_column :profiles, :undergrad_number_of_recommendations
	    remove_column :profiles, :grad_number_of_recommendations
	    remove_column :profiles, :postgrad_number_of_recommendations
	    remove_column :profiles, :latest_job_position_id
	    remove_column :profiles, :latest_job_start_date
	    remove_column :profiles, :latest_job_end_date
	    remove_column :profiles, :latest_job_current
	    remove_column :profiles, :previous_job_position_id
	    remove_column :profiles, :previous_job_start_date
	    remove_column :profiles, :previous_job_end_date
	    remove_column :profiles, :postgrad_degree
	    remove_column :profiles, :grad_degree
	    remove_column :profiles, :undergrad_degree
	    remove_column :profiles, :highschool_diploma
	    remove_column :profiles, :latest_job_team_size
	    remove_column :profiles, :previous_job_team_size
  	end
end
