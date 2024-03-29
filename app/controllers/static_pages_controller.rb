class StaticPagesController < ApplicationController
  def home
    store_location
  	#@candidate_invitations = current_candidate.invitations if current_candidate
  	unless current_candidate
          @query = set_query
          @profiles = current_query.get_profiles
          @profiles = Kaminari.paginate_array(@profiles).page(params[:page]).per(10)
  
    
    end

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

  def privacy
  end

  def thanks
  end
end
