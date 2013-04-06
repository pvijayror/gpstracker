class User::HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :pricing, :how_it_works, :contact_us, :help]
	
  def index 
    flash[:alert] = "(Prototipo)" if current_user
		render :index
	end

  def dashboard
    flash[:alert] = "(Prototipo)" if current_user
  end

  def map_devices
    flash[:alert] = "(Prototipo)" if current_user
  end

  def variable_history
    flash[:alert] = "(Prototipo)" if current_user
  end

  def generate_graph
    flash[:alert] = "(Prototipo)" if current_user
  end

  def devices
    flash[:alert] = "(Prototipo)" if current_user
  end

  def pricing
    flash[:alert] = "(Prototipo)" if current_user
  end

  def how_it_works
    flash[:alert] = "(Prototipo)" if current_user
  end

  def contact_us
    flash[:alert] = "(Prototipo)" if current_user
  end

  def help
    flash[:alert] = "(Prototipo)" if current_user
  end

end
