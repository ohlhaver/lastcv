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
  		@cu = Stripe::Customer.retrieve(current_user.customer_id) if current_user.customer_id
	end

	def update
  		@user = User.find(params[:id])
	  if @user.update_attributes(params[:user])
	  	if params[:stripeToken] != nil
	  		if @user.customer_id == nil
		  		create_customer(@user)
		  		if @user.profile_id 
		  			redirect_to :controller => "profiles", :action => "invite", :id => @user.profile_id
		  		else
		  			redirect_to root_url, notice: "Your payment details have been saved."
		  		end
		  	else
		  		update_customer(@user)
		  		redirect_to root_url, notice: "Your payment details have been updated."
		  	end
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

	def update_customer(user)
		cu = Stripe::Customer.retrieve(user.customer_id)
		cu.card  = params[:stripeToken]
		cu.save

		rescue Stripe::CardError => e
		flash[:error] = e.message
	  	redirect_back_or(root_url)
		
	end


end


