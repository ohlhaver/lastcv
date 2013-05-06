class ApplicationController < ActionController::Base
  protect_from_forgery


private

	def current_query
	  @current_query ||= Query.find(session[:query_id]) if session[:query_id]
	end
	helper_method :current_query

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def authorize_user
		store_location
	  redirect_to login_url, alert: "Not authorized" if current_user.nil?
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

    def redirect_back_or(default)
   		redirect_to(session[:return_to] || default)
   	 	session.delete(:return_to)
  	end

	def store_location
	  	session[:return_to] = request.url
	end





end
