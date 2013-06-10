class AddSchoolIdToDegree < ActiveRecord::Migration
  def change
    add_column :degrees, :school_id, :integer
  end
end
