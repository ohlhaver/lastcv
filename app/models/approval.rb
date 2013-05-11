class Approval < ActiveRecord::Base
  attr_accessible :invitation_id
  belongs_to :invitation
  after_create :email_invitation

  def email_invitation
  	UserMailer.approval(self).deliver
  end
end
