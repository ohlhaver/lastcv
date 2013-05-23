class CreateBiomedTitles < ActiveRecord::Migration
  def change
    create_table :biomed_titles do |t|
      t.string :name

      t.timestamps
    end
  end
end
