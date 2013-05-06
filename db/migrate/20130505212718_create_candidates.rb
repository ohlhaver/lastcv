class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :email
      t.string :address
      t.string :phone
      t.string :skype_id
      t.string :linkedin_url
      t.integer :profile_id

      t.timestamps
    end
  end
end
