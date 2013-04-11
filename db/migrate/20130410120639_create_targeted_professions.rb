class CreateTargetedProfessions < ActiveRecord::Migration
  def change
    create_table :targeted_professions do |t|
      t.integer :profile_id
      t.integer :profession_id
      t.integer :min_yearly_salary
      t.integer :min_hourly_salary

      t.timestamps
    end
  end
end
