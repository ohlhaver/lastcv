class Invitation < ActiveRecord::Base
  attr_accessible :candidate_id, :user_id
  belongs_to :user
  belongs_to :candidate
  has_one :approval
  after_create :email_invitation

  def email_invitation
  	CandidateMailer.delay.invitation(self)
  end

end
