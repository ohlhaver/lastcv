class AddHighestDegreeIdToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :highest_degree_id, :integer
  end
end
