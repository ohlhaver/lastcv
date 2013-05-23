class CreateJobBiomedSkills < ActiveRecord::Migration
  def change
    create_table :job_biomed_skills do |t|
      t.integer :job_id
      t.integer :biomed_skill_id

      t.timestamps
    end
  end
end
