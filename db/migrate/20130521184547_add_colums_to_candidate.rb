class AddColumsToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :password_digest, :string
    add_column :candidates, :auth_token, :string
    add_column :candidates, :password_reset_token, :string
    add_column :candidates, :password_reset_sent_at, :datetime
  end
end
