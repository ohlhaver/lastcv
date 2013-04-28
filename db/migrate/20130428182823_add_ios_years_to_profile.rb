class AddIosYearsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :ios_years, :float
  end
end
