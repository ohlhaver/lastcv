class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :school_name
      t.integer :subject_id
      t.float :gpa
      t.integer :level

      t.timestamps
    end
  end
end
