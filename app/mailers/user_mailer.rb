class UserMailer < ActionMailer::Base
	add_template_helper(ProfilesHelper)
  default from: "\"TapCV\" <update@TapCV.com>"


  def signup(user)
  	@user = user
  	@subject = "Welcome to TapCV"
  	mail :to => @user.email, :subject => @subject
  end

  def approval(approval)
  	@approval = approval

  	@invitation = @approval.invitation
  	@user = @invitation.user
    @candidate = @invitation.candidate
    @profile =@candidate.profile
    @subject = "Your request was accepted"
   	mail :to => @user.email, :subject => @subject
  end

  def payment_failure(approval, error)
    @approval = approval
    @amount = "4.95"
    @user = @approval.invitation.user
    @profile = @approval.invitation.candidate.profile
    @error = error.message
    @subject = "Payment failed"
    mail :to => @user.email, :subject => @subject
  end

  def verify(user)
  	@user = user
  	@subject = "User " + @user.id.to_s + " needs to be verified"
  	mail :to => "ohlhaver@gmail.com", :subject => @subject
  end

  def receipt(approval, amount)
    @approval = approval
    @amount = amount
    @user = @approval.invitation.user
    @profile = @approval.invitation.candidate.profile
    @subject = "[TapCV] Payment Receipt"
    mail :to => @user.email, :subject => @subject
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

end
