class AddDegreeFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :postgrad_degree, :boolean
    add_column :profiles, :grad_degree, :boolean
    add_column :profiles, :undergrad_degree, :boolean
    add_column :profiles, :highschool_diploma, :boolean
  end
end
