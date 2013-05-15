class CreateJobPlatforms < ActiveRecord::Migration
  def change
    create_table :job_platforms do |t|
      t.integer :job_id
      t.integer :platform_id

      t.timestamps
    end
  end
end
