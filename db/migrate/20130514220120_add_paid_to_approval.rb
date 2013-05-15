class AddPaidToApproval < ActiveRecord::Migration
  def change
    add_column :approvals, :paid, :boolean
  end
end
