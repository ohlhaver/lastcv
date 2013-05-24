class AddSiliconValleyPartTimeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :silicon_valley_part_time, :boolean
  end
end
