class AddMorefieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :silicon_valley, :boolean
    add_column :profiles, :notice_period, :integer
    add_column :profiles, :work_permit, :boolean
    add_column :profiles, :latest_job_contract, :integer
    add_column :profiles, :previous_job_contract, :integer
    add_column :profiles, :latest_job_hourly_salary, :integer
    add_column :profiles, :previous_job_hourly_salary, :integer
    add_column :profiles, :latest_job_annual_salary, :integer
    add_column :profiles, :previous_job_annual_salary, :integer
    add_column :profiles, :latest_job_people_led, :integer
    add_column :profiles, :previous_job_people_led, :integer
    add_column :profiles, :latest_job_company_size, :integer
    add_column :profiles, :previous_job_company_size, :integer
    add_column :profiles, :latest_job_company_name, :string
    add_column :profiles, :previous_job_company_name, :string
    remove_column :profiles, :latest_job_company_id
    remove_column :profiles, :latest_job_profession_id
    remove_column :profiles, :latest_job_salary
    remove_column :profiles, :latest_job_number_of_recommendations
    remove_column :profiles, :latest_job_project_keywords
    remove_column :profiles, :previous_job_company_id
    remove_column :profiles, :previous_job_profession_id
    remove_column :profiles, :previous_job_salary
    remove_column :profiles, :previous_job_number_of_recommendations
    remove_column :profiles, :previous_job_project_keywords
    remove_column :profiles, :earliest_start_date
    remove_column :profiles, :cfa
    remove_column :profiles, :gmat
    remove_column :profiles, :lsat
  end
end
