class AddFieldsToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :contract, :integer
    add_column :jobs, :hourly_salary, :integer
    add_column :jobs, :annual_salary, :integer
    add_column :jobs, :people_led, :integer
    add_column :jobs, :company_size, :integer
    add_column :jobs, :position_id, :integer
    add_column :jobs, :start_date, :date
    add_column :jobs, :end_date, :date
    add_column :jobs, :current, :boolean
    add_column :jobs, :team_size, :integer
  end
end
