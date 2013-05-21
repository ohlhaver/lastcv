class AddWorkPermitRequiredToQuery < ActiveRecord::Migration
  def change
    add_column :queries, :work_permit_required, :boolean
  end
end
