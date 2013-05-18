class User::TracedRoutesController < ApplicationController

  before_filter :authenticate_user!

  helper_method :traced_routes, :traced_route, :polylines_json

  def traced_route
    @traced_route||=traced_routes.find(params[:traced_route_id])
  end

  def traced_routes
    @traced_routes||=device.traced_routes.paginate(:page => params[:page])
  end

  def polylines_json
    polilynes = Array.new
    coordinates = traced_route.collected_measurements.select("longitude, latitude")
    coordinates.each do |x|
      polilynes << {"lng"=>x.longitude, "lat"=>x.latitude}
    end 
    if coordinates.blank? 
      flash.now[:notice] = "There isn't received data for this route"
    end
    @polylines_json = [polilynes].to_json
  end

  def device
    @device||=current_user.devices.includes(:collected_measurements).find(params[:device_id])
  end



end
