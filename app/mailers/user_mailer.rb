class UserMailer < ActionMailer::Base
	add_template_helper(ProfilesHelper)
  default from: "\"BriefCV\" <update@briefcv.com>"


  def signup(user)
  	@user = user
  	@subject = "Welcome to BriefCV"
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

  def verify(user)
  	@user = user
  	@subject = "User " + @user.id.to_s + " needs to be verified"
  	mail :to => "ohlhaver@gmail.com", :subject => @subject
  end

end
