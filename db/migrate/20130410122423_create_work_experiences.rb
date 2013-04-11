class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.integer :profile_id
      t.integer :company_id
      t.integer :profession_id
      t.integer :highest_position_id
      t.date :start_date
      t.date :end_date
      t.integer :number_of_recommendations
      t.integer :highest_yearly_salary
      t.string :project_keywords

      t.timestamps
    end
  end
end
