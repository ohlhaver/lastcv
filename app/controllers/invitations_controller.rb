class InvitationsController < ApplicationController
	before_filter :authorize_candidate, only: [:show, :accept]
	def show
		@invitation = Invitation.find(params[:id])
	end

	def accept
		@invitation = Invitation.find(params[:id])
		unless @invitation.approval
			approval = Approval.new
			approval.invitation_id = @invitation.id
			approval.save
		end
		redirect_to @invitation
	end

end
