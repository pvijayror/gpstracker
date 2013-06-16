class User::SubscriptionsController < ApplicationController

  def new
    @subscription_type = SubscriptionType.find_by_id(params[:subscription_type_id])
  end

  def create
    subscription_type = SubscriptionType.find_by_id(params[:subscription])
    unless subscription_type.nil? 
      amount = (subscription_type.price * 100).to_i
      charge = Stripe::Charge.create(
              :amount => amount,
              :currency => "usd",
              :card => params["stripeToken"], # obtained with Stripe.js
              :description => "PRAIG Subscription"
            )
      if charge.paid
        ip = request.env['REMOTE_ADDR']
        subscription = Subscription.create(:user_id => current_user.id, :start_date => Time.now.to_date, :end_date => Time.now.to_date+1.year)
        Payment.create(:subscription_id => subscription.id, :amount => amount.to_f / 100, :card_type => charge.card.type, :last4 => charge.card.last4)
        flash[:success] = "Subscription Successful!"
      else
        flash[:error] = "Payment Unsuccessful"
      end
    else
      flash[:error] = "Payment Unsuccessful"
    end
    redirect_to user_dashboard_path
  rescue
    flash[:error] = "Payment Unsuccessful"
    redirect_to new_user_subscription_path
  end
end
