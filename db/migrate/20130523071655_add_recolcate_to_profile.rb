class AddRecolcateToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :relocate, :boolean
  end
end
