class AddHighestPositionToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :highest_position_id, :integer
  end
end
