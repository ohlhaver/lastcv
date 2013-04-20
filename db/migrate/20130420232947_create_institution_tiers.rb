class CreateInstitutionTiers < ActiveRecord::Migration
  def change
    create_table :institution_tiers do |t|
      t.string :name

      t.timestamps
    end
  end
end
