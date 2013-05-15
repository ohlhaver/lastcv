class ApplicationController < ActionController::Base
  protect_from_forgery


private

	def current_query
	  @current_query ||= Query.find(session[:query_id]) if session[:query_id]
		rescue
	end
	helper_method :current_query

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def authorize_user
		store_location
	  redirect_to login_url, alert: "Please log in or sign up!" if current_user.nil?
	end



	def current_candidate
  		@current_candidate ||= Candidate.find(session[:candidate_id]) if session[:candidate_id]
	end
	helper_method :current_candidate

	def authorize_candidate
		store_location
	  redirect_to "/auth/facebook", alert: "Not authorized" if current_candidate.nil?
	end

	def first_profile
		redirect_to root_path if current_candidate && current_candidate.profile
	end

	def correct_candidate
      @profile = Profile.find(params[:id])
      redirect_to root_path, alert: "Not authorized" unless current_candidate && current_candidate.profile == @profile
    end

    def invited_candidate
    	@invitation = Invitation.find(params[:id])
    	redirect_to root_path, alert: "Not authorized" unless current_candidate && @invitation.candidate == current_candidate
    end


    def redirect_back_or(default)
   		redirect_to(session[:return_to] || default)
   	 	session.delete(:return_to)
  	end

	def store_location
	  	session[:return_to] = request.url
	end

	def find_invitation(profile)
		if current_user
		 invitation = Invitation.find_by_user_id_and_candidate_id(current_user.id,profile.candidate.id)
		end
	end
	helper_method :find_invitation





end
