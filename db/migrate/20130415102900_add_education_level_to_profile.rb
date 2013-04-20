class AddEducationLevelToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :education_level, :integer
  end
end
