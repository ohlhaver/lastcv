class SessionsController < ApplicationController
	def new
	end

	def create
	  user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])
	        if params[:remember_me]
      			cookies.permanent[:auth_token] = user.auth_token
    		else
      			cookies[:auth_token] = user.auth_token
    		end
	    redirect_back_or(root_url)
	  else
	    flash.now.alert = "Email or password is invalid"
	    render "new"
	  end
	end

	def destroy
	  cookies.delete(:auth_token)
	  redirect_to root_url, notice: "Logged out!"
	end

	def candidate_create
    	candidate = Candidate.from_omniauth(env["omniauth.auth"])
    	session[:candidate_id] = candidate.id
    	if candidate.profile
    		redirect_back_or(root_url)
    	else
    		redirect_to new_profile_path
    	end
  	end

  	def candidate_destroy
    	session[:candidate_id] = nil
    	redirect_to root_url
  	end
end
