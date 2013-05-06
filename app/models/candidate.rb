class Candidate < ActiveRecord::Base
  attr_accessible :address, :email, :linkedin_url, :name, :oauth_expires_at, :oauth_token, :phone, :profile_id, :provider, :skype_id, :uid
  belongs_to :profile
  has_many :invitations

  	def self.from_omniauth(auth)
	  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.email = auth.info.email
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.save!
	  end
	end
end
