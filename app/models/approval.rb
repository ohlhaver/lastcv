class Approval < ActiveRecord::Base
  attr_accessible :invitation_id
  belongs_to :invitation
  after_create :charge_and_email_approval

   def charge_and_email_approval
      self.delay.charge_and_email_approval
   end

  def charge_and_email_approval_method
      customer_id = invitation.user.customer_id
      charge = charge_method(customer_id)
      
      #return
      #flash[:error] = e.message
      if charge && charge.paid == true
        self.paid = true
        self.save
  		  UserMailer.delay.approval(self)
        amount = charge.amount.fdiv(100) 
        UserMailer.delay.receipt(self, amount)
      end
 	end

  def charge_method(customer_id)
    charge = Stripe::Charge.create(:amount   => 495, :currency => "usd",:customer => customer_id)
      rescue Stripe::CardError => e
      UserMailer.delay.payment_failure(self,e)  
      return charge
  end

end
