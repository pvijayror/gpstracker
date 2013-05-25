class User::HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :pricing, :how_it_works, :contact_us, :help]
	before_filter :needs_subscription, :except => [:subscribe]

  def index 
		render :index
	end

  def subscribe
    redirect_to :root if current_user.subscriptions.last.active?
  rescue => e
    logger.info "No subscriptions found"
  end



end

