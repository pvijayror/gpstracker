class User::TracedRoutesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :needs_subscription
  helper_method :traced_routes, :traced_route, :polylines_json, :first_and_last_markers

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
      if polilynes.count < 1
        polilynes << {"lng"=>x.longitude, "lat"=>x.latitude}
      else
        polilynes << {"lng"=>x.longitude, "lat"=>x.latitude}
      end
    end 
    if coordinates.blank? 
      flash.now[:notice] = "There isn't received data for this route"
    end
    @polylines_json = [polilynes].to_json
  rescue
    nil
  end

  def first_and_last_markers
    coordinates = traced_route.collected_measurements.select("longitude, latitude")
    data = [{"lng" => coordinates.first.longitude, "lat" => coordinates.first.latitude, "picture" => "http://maps.google.com/mapfiles/marker_greenA.png"},  {"lng" => coordinates.last.longitude, "lat" => coordinates.last.latitude, "picture" => "http://maps.google.com/mapfiles/marker_purpleB.png"}]
    p data.to_json
  rescue 
    nil
  end

  def device
    @device||=current_user.devices.includes(:collected_measurements).find(params[:device_id])
  end



end
