class AddBiocolumnsToJob < ActiveRecord::Migration
  def change
  	add_column :jobs, :biomed_position_id, :integer
  	add_column :jobs, :biomed_title_id, :integer
  	add_column :jobs, :company_stage_id, :integer
  end
end
