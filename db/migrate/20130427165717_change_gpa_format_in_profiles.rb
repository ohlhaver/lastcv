class ChangeGpaFormatInProfiles < ActiveRecord::Migration
  def change
    change_column :profiles, :undergrad_gpa, :float
    change_column :profiles, :grad_gpa, :float
    change_column :profiles, :postgrad_gpa, :float
  end
end
