class AddFieldIdToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :field_id, :integer
  end
end
