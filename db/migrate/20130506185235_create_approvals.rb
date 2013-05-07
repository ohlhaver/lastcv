class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.integer :invitation_id

      t.timestamps
    end
  end
end
