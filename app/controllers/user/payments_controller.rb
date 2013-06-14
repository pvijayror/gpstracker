class User::PaymentsController < ApplicationController
  before_filter :authenticate_user!

  helper_method :payments, :payment

  def payment
    @payment=Payment.find_by_id(params[:payment_id])
  end

  def payments
    payments = Array.new
    current_user.subscriptions.each do |s|
      payments << s.payment
    end
    @payments=payments
  end
end
