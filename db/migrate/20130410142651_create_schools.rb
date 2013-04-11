class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :institution_id
      t.integer :school_type_id
      t.integer :subject_id
      t.integer :value

      t.timestamps
    end
  end
end
