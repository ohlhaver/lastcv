class CreateProfileBiomedSkills < ActiveRecord::Migration
  def change
    create_table :profile_biomed_skills do |t|
      t.integer :profile_id
      t.integer :biomed_skill_id

      t.timestamps
    end
  end
end
