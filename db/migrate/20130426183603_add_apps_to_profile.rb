class AddAppsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :android_apps, :integer
    add_column :profiles, :ios_apps, :integer
    add_column :profiles, :windows_apps, :integer
  end
end
