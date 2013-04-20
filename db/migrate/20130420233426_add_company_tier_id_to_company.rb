class AddCompanyTierIdToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :company_tier_id, :integer
  end
end
