class Approval < ActiveRecord::Base
  attr_accessible :invitation_id
  belongs_to :invitation
  after_create :charge_and_email_approval

  def charge_and_email_approval
      customer_id = invitation.user.customer_id
      charge = Stripe::Charge.create(:amount   => 495, :currency => "usd",:customer => customer_id)
      if charge.paid == true
        self.paid = true
        self.save
  		  UserMailer.approval(self).deliver
        amount = charge.amount.fdiv(100) 
        UserMailer.receipt(self, amount).deliver
      end
 	end

end
