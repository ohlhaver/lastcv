class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :password, :password_confirmation, :company_name, :website, :contact_person
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :company_name, :contact_person
  has_many :invitations
end
