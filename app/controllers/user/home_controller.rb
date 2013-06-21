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

  def page_404
    redirect_to root_path
  end

  def set_language
    if ['es', 'en', 'zh'].include?(params[:id])
      p params
      begin
        params[:url]["#{session[:locale]}"] = params[:id] 
        session[:locale] = params[:id]
        redirect_to params[:url]
      rescue
        session[:locale] = params[:id]
        redirect_to :back
      end
    else
      redirect_to :back
    end
  end



end

