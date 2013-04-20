class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :search_term
      t.boolean :cfa
      t.date :latest_availability
      t.integer :max_salary
      t.integer :targeted_profession_id
      t.integer :min_degree
      t.integer :subject_id
      t.float :min_gpa
      t.integer :min_institution_tier_id
      t.integer :past_profession_id
      t.integer :past_company_id
      t.float :min_working_years
      t.integer :min_highest_position_id
      t.integer :min_highest_salary
      t.integer :min_company_tier_id

      t.timestamps
    end
  end
end
