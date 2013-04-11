class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.date :earliest_start_date
      t.boolean :full_time
      t.boolean :part_time
      t.integer :max_part_time_hours
      t.integer :min_part_time_hours
      t.integer :sat_math
      t.integer :sat_critical_reading
      t.integer :sat_writing
      t.integer :sat_total_old
      t.integer :sat_total_new
      t.integer :act_english
      t.integer :act_math
      t.integer :act_reading
      t.integer :act_science
      t.integer :act_composite
      t.integer :gmat
      t.integer :lsat
      t.integer :general_min_yearly_salary
      t.integer :general_min_hourly_salary
      t.string :highschool_name
      t.integer :ranking_in_highschool
      t.integer :percentile_in_highschool
      t.integer :recommendations_in_highschool

      t.timestamps
    end
  end
end
