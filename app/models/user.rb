class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :password, :password_confirmation, :company_name, :website, :contact_person
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :company_name, :contact_person, :website
  has_many :invitations
  #has_many :invited_candidates, through: :invitations, source: :candidate
  #has_many :invited_profiles, through: :invited_candidates, source: :profile
end
