class CreateProfileCities < ActiveRecord::Migration
  def change
    create_table :profile_cities do |t|
      t.integer :profile_id
      t.integer :city_id

      t.timestamps
    end
  end
end
