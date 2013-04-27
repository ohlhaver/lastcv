class CreateCurrentJobPlatforms < ActiveRecord::Migration
  def change
    create_table :current_job_platforms do |t|
      t.integer :profile_id
      t.integer :platform_id

      t.timestamps
    end
  end
end
