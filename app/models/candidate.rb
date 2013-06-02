class Candidate < ActiveRecord::Base
  attr_accessible :address, :email, :linkedin_url, :name, :oauth_expires_at, :oauth_token, :phone, :profile_id, :provider, :skype_id, :uid,
  :password, :password_confirmation
  belongs_to :profile
  has_many :invitations
  before_create { generate_token(:auth_token) }
  after_create :email_welcome
  has_secure_password
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
  validates_presence_of :name



  def email_welcome
  	CandidateMailer.delay.signup(self)
  end

  	def self.from_omniauth(auth)
	  #where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	  	user = Candidate.find_or_create_by_email(auth.info.email)
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.email = auth.info.email
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    if user.password_digest == nil
	    	#user.password_digest = SecureRandom.urlsafe_base64
	    	user.password = SecureRandom.urlsafe_base64
	    	user.password_confirmation = user.password
	    end
	    user.save!
	  #end
	  return user
	end

 def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    CandidateMailer.delay.password_reset(self)
  end

	def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Candidate.exists?(column => self[column])
  end
end
