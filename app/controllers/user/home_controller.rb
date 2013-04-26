class User::HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :pricing, :how_it_works, :contact_us, :help]
	
  def index 
		render :index
	end

  def dashboard
    
  end

  def map_devices
    
  end

  def variable_history
    
  end

  def generate_graph
    
  end

  def devices
    
  end

  def pricing
    
  end

  def how_it_works
    
  end

  def contact_us
    
  end

  def help
    
  end

  def reports
    
  end

  def lineal_regresion
    
  end

  def dependency_analysis
    
  end

  def stationality_analysis
    
  end

end
