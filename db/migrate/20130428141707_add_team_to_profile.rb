class AddTeamToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :latest_job_team_size, :integer
    add_column :profiles, :previous_job_team_size, :integer
  end
end
