class User::HomeController < ApplicationController
  before_filter :authenticate_user!
	def index
		render :index
	end

  def dashboard
    flash[:alert] = "(Prototipo)"
  end

  def map_devices
    flash[:alert] = "(Prototipo)"
  end

  def variable_history
    flash[:alert] = "(Prototipo)"
  end

  def generate_graph
    flash[:alert] = "(Prototipo)"
  end

  def devices
    flash[:alert] = "(Prototipo)"
  end
end
