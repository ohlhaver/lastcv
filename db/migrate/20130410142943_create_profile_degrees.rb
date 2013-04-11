class CreateProfileDegrees < ActiveRecord::Migration
  def change
    create_table :profile_degrees do |t|
      t.integer :profile_id
      t.integer :school_id
      t.integer :college_subject_id
      t.integer :gpa
      t.integer :number_of_recommendations
      t.date :graduation_date

      t.timestamps
    end
  end
end
