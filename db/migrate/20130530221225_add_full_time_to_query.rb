class AddFullTimeToQuery < ActiveRecord::Migration
  def change
    add_column :queries, :full_time, :boolean
  end
end
