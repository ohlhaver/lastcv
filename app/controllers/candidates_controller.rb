class CandidatesController < ApplicationController
	def new
  		@candidate = Candidate.new
	end

	def create
  		@candidate = Candidate.new(params[:candidate])
	  if @candidate.save
	    session[:candidate_id] = candidate.id
	    redirect_back_or(root_url)
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
