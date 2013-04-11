class CreateProfessionPositions < ActiveRecord::Migration
  def change
    create_table :profession_positions do |t|
      t.integer :profession_id
      t.integer :position_id

      t.timestamps
    end
  end
end
