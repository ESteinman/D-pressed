class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @user = User.find(params[:id])
    end


    def create_subscription
        user = User.find(params[:user_id])
        customer = Stripe::Customer.create(email: user.email, source: params['stripeToken'])
        charge = Stripe::Charge.create(customer: customer.id, amount: (10 * 100), description: 'D-Pressed Subscription', currency: 'usd')
        if charge.paid?
            user.subscriber!
            flash[:notice] = 'You have succesfully subscribed to D-pressed'   
        else
            flash[:error] = 'Could not subscribe to D-pressed'
        end
        redirect_back(fallback_location: root_path)
    end

end

