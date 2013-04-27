class AddReferencesToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :references, :boolean
  end
end
