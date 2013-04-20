class AddInstitutionTierIdToInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :institution_tier_id, :integer
  end
end
