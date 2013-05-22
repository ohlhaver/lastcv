class CandidatesController < ApplicationController
	def new
  		@candidate = Candidate.new
	end

	def create
  		@candidate = Candidate.new(params[:candidate])
	  if @candidate.save
	    session[:candidate_id] = @candidate.id
	    if @candidate.profile
    		redirect_back_or(root_url)
    	else
    		redirect_to new_profile_path
    	end
	  else
	    render "new"
	  end
	end

    def edit
  		@candidate = Candidate.find(params[:id])
	end

	def update
  		@candidate = Candidate.find(params[:id])
	  if @candidate.update_attributes(params[:candidate])

	    redirect_to root_url, notice: "Your profile has been updated."

	  else
	    render "edit"
	  end
	end

end
