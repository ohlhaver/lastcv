class AddPositionNameToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :postion_name, :string
  end
end
