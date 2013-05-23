class CreateBiomedSkills < ActiveRecord::Migration
  def change
    create_table :biomed_skills do |t|
      t.string :name

      t.timestamps
    end
  end
end
