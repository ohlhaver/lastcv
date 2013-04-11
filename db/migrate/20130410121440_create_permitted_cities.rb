class CreatePermittedCities < ActiveRecord::Migration
  def change
    create_table :permitted_cities do |t|
      t.integer :profile_id
      t.integer :city_id

      t.timestamps
    end
  end
end
