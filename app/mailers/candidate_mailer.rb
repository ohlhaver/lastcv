class CandidateMailer < ActionMailer::Base
  default from: "\"BriefCV\" <update@briefcv.com>"


  def invitation(invitation)
    @invitation = invitation
   	@user = @invitation.user
    @candidate = @invitation.candidate
    @subject = "Request for your contact details"
   	mail :to => @candidate.email, :subject => @subject
  end

  def signup(candidate)
  	@candidate = candidate
  	@subject = "Welcome to BriefCV"
  	mail :to => @candidate.email, :subject => @subject

  end




end
