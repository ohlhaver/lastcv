class AddAppYearsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :app_years, :float
  end
end
