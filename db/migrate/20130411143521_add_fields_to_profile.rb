class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :undergrad_institution_id, :integer
    add_column :profiles, :undergrad_subject_id, :integer
    add_column :profiles, :undergrad_gpa, :integer
    add_column :profiles, :grad_institution_id, :integer
    add_column :profiles, :grad_subject_id, :integer
    add_column :profiles, :grad_gpa, :integer
    add_column :profiles, :postgrad_institution_id, :integer
    add_column :profiles, :postgrad_subject_id, :integer
    add_column :profiles, :postgrad_gpa, :integer
    add_column :profiles, :undergrad_number_of_recommendations, :integer
    add_column :profiles, :grad_number_of_recommendations, :integer
    add_column :profiles, :postgrad_number_of_recommendations, :integer
    add_column :profiles, :latest_job_company_id, :integer
    add_column :profiles, :latest_job_profession_id, :integer
    add_column :profiles, :latest_job_position_id, :integer
    add_column :profiles, :latest_job_salary, :integer
    add_column :profiles, :latest_job_number_of_recommendations, :integer
    add_column :profiles, :latest_job_start_date, :date
    add_column :profiles, :latest_job_end_date, :date
    add_column :profiles, :latest_job_current, :boolean
    add_column :profiles, :latest_job_project_keywords, :string
    add_column :profiles, :previous_job_company_id, :integer
    add_column :profiles, :previous_job_profession_id, :integer
    add_column :profiles, :previous_job_position_id, :integer
    add_column :profiles, :previous_job_salary, :integer
    add_column :profiles, :previous_job_number_of_recommendations, :integer
    add_column :profiles, :previous_job_start_date, :date
    add_column :profiles, :previous_job_end_date, :date
    add_column :profiles, :previous_job_project_keywords, :string
  end
end
