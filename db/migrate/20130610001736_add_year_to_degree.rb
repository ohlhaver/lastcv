class AddYearToDegree < ActiveRecord::Migration
  def change
    add_column :degrees, :year, :integer
  end
end
