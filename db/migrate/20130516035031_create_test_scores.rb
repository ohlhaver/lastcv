class CreateTestScores < ActiveRecord::Migration
  def change
    create_table :test_scores do |t|
      t.integer :score
      t.integer :type
      t.integer :profile_id

      t.timestamps
    end
  end
end
