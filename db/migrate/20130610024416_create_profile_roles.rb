class CreateProfileRoles < ActiveRecord::Migration
  def change
    create_table :profile_roles do |t|
      t.integer :profile_id
      t.integer :role_id

      t.timestamps
    end
  end
end
