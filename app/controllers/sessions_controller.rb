class SessionsController < ApplicationController
	def new
	end

    def candidate_new
	end

	def create
		if params[:login_type] == "candidate"
	  
		  candidate = Candidate.find_by_email(params[:email])
		  	if candidate && candidate.authenticate(params[:password])
		        #if params[:remember_me]
	      		session[:candidate_id] = candidate.id
	    		#else
	      		#	session[:candidate_id] = candidate.id
	    		#end
	    		if candidate.profile
		    		redirect_back_or(root_url)
		    	else
		    		redirect_to new_profile_path
		    	end
	    	else
			    flash.now.alert = "Email or password is invalid"
			    render "candidate_new"
	    	end
		else
		  user = User.find_by_email(params[:email])
		  	if user && user.authenticate(params[:password])
		        #if params[:remember_me]
	      		session[:user_id] = user.id
	    		#else
	      		#	session[:user_id] = user.id
	    		#end
	    		redirect_back_or(root_url)
	    	else
			    flash.now.alert = "Email or password is invalid"
			    render "new"
	    	end
		end
		  

	    

	end

	def destroy
	  session[:user_id] = nil
	  session[:candidate_id] = nil
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

  	#def candidate_destroy
    #	session[:candidate_id] = nil
    #	redirect_to root_url
  	#end
end
