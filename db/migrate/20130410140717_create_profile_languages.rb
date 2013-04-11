class CreateProfileLanguages < ActiveRecord::Migration
  def change
    create_table :profile_languages do |t|
      t.integer :language_id
      t.integer :profile_id

      t.timestamps
    end
  end
end
