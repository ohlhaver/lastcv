class ChangeFieldsInQuery < ActiveRecord::Migration
  def change
  	add_column :queries, :max_notice_period, :integer
  	add_column :queries, :top_schools, :boolean
	remove_column :queries, :cfa
	remove_column :queries, :latest_availability
	remove_column :queries, :targeted_profession_id
	remove_column :queries, :min_institution_tier_id
	remove_column :queries, :past_profession_id
	remove_column :queries, :past_company_id
	remove_column :queries, :min_working_years
	remove_column :queries, :min_company_tier_id
  end
end
