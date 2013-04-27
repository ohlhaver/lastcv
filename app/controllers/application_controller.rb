class ApplicationController < ActionController::Base
  protect_from_forgery


private

	def current_query
	  @current_query ||= Query.find(session[:query_id]) if session[:query_id]

	end
	helper_method :current_query
end
