class AddAndroidYearsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :android_years, :float
  end
end
