class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :company_name, :string
    add_column :users, :website, :string
    add_column :users, :contact_person, :string
    add_column :users, :verified, :boolean
  end
end
