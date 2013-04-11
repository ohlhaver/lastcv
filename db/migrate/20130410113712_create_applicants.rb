class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :phone
      t.string :skype_id
      t.string :linked_in_url
      t.integer :profile_id

      t.timestamps
    end
  end
end
