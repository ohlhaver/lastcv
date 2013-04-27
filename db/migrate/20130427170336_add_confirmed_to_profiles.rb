class AddConfirmedToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :confirmed, :boolean
  end
end
