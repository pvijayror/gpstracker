class User::SubscriptionsController < ApplicationController
  def create
    amount = 10000
    charge = Stripe::Charge.create(
            :amount => amount,
            :currency => "usd",
            :card => params["stripeToken"], # obtained with Stripe.js
            :description => "PRAIG Subscription"
          )
    if charge.paid
      ip = request.env['REMOTE_ADDR']
      subscription = Subscription.create(:user_id => current_user.id, :start_date => Time.now.to_date, :end_date => Time.now.to_date+1.year)
      Payment.create(:subscription_id => subscription.id, :amount => amount)
      flash[:success] = "Subscription Successful!"
    else
      flash[:error] = "Payment Unsuccessful"
    end

    redirect_to user_dashboard_path
  end
end
