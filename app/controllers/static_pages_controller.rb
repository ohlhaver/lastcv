class StaticPagesController < ApplicationController
  def home
  	#@candidate_invitations = current_candidate.invitations if current_candidate
  	if current_query
      @query = current_query
    else
      @query = Query.create!
      session[:query_id] = @query.id
  
    end

    @profiles = Profile.all.select {|i| i.candidate }
    if current_user
	    @open_invitations = current_user.invitations.select {|i| i.approval == nil }

	    @approved_invitations = current_user.invitations.select {|i| i.approval }
	  end

  end

  def about
  end

  def contact
  end

  def faq
  end
end