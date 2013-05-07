class InvitationsController < ApplicationController
	before_filter :invited_candidate, only: [:show, :accept]
	def show
		@invitation = Invitation.find(params[:id])
	end

	def accept
		@invitation = Invitation.find(params[:id])
		approval = Approval.new
		approval.invitation_id = @invitation.id
		approval.save
		redirect_to @invitation
	end

end
