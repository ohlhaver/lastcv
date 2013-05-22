class PasswordResetsController < ApplicationController
		def new
	end

    def candidate_new
	end


	def create
		 if params[:login_type] == "candidate"
		 	user = Candidate.find_by_email(params[:email])
		 else
		 	user = User.find_by_email(params[:email])
		 end
		  user.send_password_reset if user
		  redirect_to root_url, :notice => "Email sent with password reset instructions."
	end

	def edit
		if User.find_by_password_reset_token(params[:id])
	  @user = User.find_by_password_reset_token(params[:id])
	  else 
	  	@user= Candidate.find_by_password_reset_token(params[:id])
	  end
	end

	def update
	  if User.find_by_password_reset_token(params[:id])
	  @user = User.find_by_password_reset_token(params[:id])
	  if @user.password_reset_sent_at < 2.hours.ago
	    redirect_to new_password_reset_path, :alert => "Password reset has expired."
	  elsif @user.update_attributes(params[:user])
	  	session[:user_id] = @user.id
	    redirect_to root_url, :notice => "Password has been reset!"
	  else
	    render :edit
	  end
	  else 
	  	@user= Candidate.find_by_password_reset_token(params[:id])
	  	if @user.password_reset_sent_at < 2.hours.ago
	    redirect_to new_password_reset_path, :alert => "Password reset has expired."
	  elsif @user.update_attributes(params[:candidate])
	  	session[:candidate_id] = @user.id
	    redirect_to root_url, :notice => "Password has been reset!"
	  else
	    render :edit
	  end
	  end

	end

end
