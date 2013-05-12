class Approval < ActiveRecord::Base
  attr_accessible :invitation_id
  belongs_to :invitation
  after_create :email_approval
  after_create :charge_customer

  	def email_approval
  		UserMailer.approval(self).deliver
 	end

 	def charge_customer
 		customer_id = invitation.user.customer_id
		  Stripe::Charge.create(
		  :amount   => 495, # $15.00 this time
		  :currency => "usd",
		  :customer => customer_id
		)
  	end
end
