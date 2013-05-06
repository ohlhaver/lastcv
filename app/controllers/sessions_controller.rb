class SessionsController < ApplicationController
	def new
	end

	def create
	  user = User.find_by_email(params[:email])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_back_or(root_url)
	  else
	    flash.now.alert = "Email or password is invalid"
	    render "new"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, notice: "Logged out!"
	end

	def candidate_create
    	candidate = Candidate.from_omniauth(env["omniauth.auth"])
    	session[:candidate_id] = candidate.id
    	redirect_to :root
  	end

  	def candidate_destroy
    	session[:candidate_id] = nil
    	redirect_to root_url
  	end
end
