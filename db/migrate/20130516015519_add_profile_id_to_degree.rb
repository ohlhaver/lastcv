class AddProfileIdToDegree < ActiveRecord::Migration
  def change
    add_column :degrees, :profile_id, :integer
  end
end
