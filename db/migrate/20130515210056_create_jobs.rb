class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :profile_id
      t.string :company_name

      t.timestamps
    end
  end
end
