class CreateCompanyTiers < ActiveRecord::Migration
  def change
    create_table :company_tiers do |t|
      t.string :name

      t.timestamps
    end
  end
end
