class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :password, :password_confirmation, :company_name, :website, :contact_person, :verified, :profile_id
  attr_accessor :profile_id
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :company_name, :contact_person, :website
  has_many :invitations
  #has_many :invited_candidates, through: :invitations, source: :candidate
  #has_many :invited_profiles, through: :invited_candidates, source: :profile
  before_create { generate_token(:auth_token) }
  after_create :email_welcome
  after_create :email_admin

  def email_welcome
  	UserMailer.delay.signup(self)
  end

  def email_admin
  	UserMailer.delay.verify(self)
  end


  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.delay.password_reset(self)
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
