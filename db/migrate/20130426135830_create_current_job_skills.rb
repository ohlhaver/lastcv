class CreateCurrentJobSkills < ActiveRecord::Migration
  def change
    create_table :current_job_skills do |t|
      t.integer :profile_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
