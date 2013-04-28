class AddMinYearsToQuery < ActiveRecord::Migration
  def change
    add_column :queries, :min_years, :float
  end
end
