class CreateBiomedPositions < ActiveRecord::Migration
  def change
    create_table :biomed_positions do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
