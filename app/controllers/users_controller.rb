class UsersController < ApplicationController
	def new
  		@user = User.new
	end

	def create
  		@user = User.new(params[:user])
	  if @user.save
	    session[:user_id] = @user.id

	    


	    redirect_back_or(root_url)
	  else
	    render "new"
	  end
	end

    def edit
  		@user = User.find(params[:id])
	end

	def update
  		@user = User.find(params[:id])
	  if @user.update_attributes(params[:user])
	  	if params[:stripeToken] != nil
	  		create_customer(@user) 
	  		redirect_to :controller => "profiles", :action => "invite", :id => @user.profile_id
	  	else
	    redirect_to root_url, notice: "Your profile has been updated."
		end
	  else
	    render "edit"
	  end
	end

	def create_customer(user)
		customer = Stripe::Customer.create(
    	:description => user.email,
    	:card  => params[:stripeToken]
  	)
		user.customer_id = customer.id
		user.save



		rescue Stripe::CardError => e
		flash[:error] = e.message
	  	redirect_back_or(root_url)
		
	end
end


