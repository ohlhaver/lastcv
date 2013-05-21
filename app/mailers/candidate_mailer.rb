class CandidateMailer < ActionMailer::Base
  default from: "\"TapCV\" <update@TapCV.com>"


  def invitation(invitation)
    @invitation = invitation
   	@user = @invitation.user
    @candidate = @invitation.candidate
    @subject = "Request for your contact details"
   	mail :to => @candidate.email, :subject => @subject
  end

  def signup(candidate)
  	@candidate = candidate
  	@subject = "Welcome to TapCV"
  	mail :to => @candidate.email, :subject => @subject

  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end




end
