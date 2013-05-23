class AddBiocolumnsToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :biomed, :boolean
  	add_column :profiles, :biomed_years, :float
  end
end
