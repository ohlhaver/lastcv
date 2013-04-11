class AddCfaToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :cfa, :boolean
  end
end
