class User::TracedRoutesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :needs_subscription
  helper_method :traced_routes, :traced_route, :polylines_json, :first_and_last_markers, :heat_map

  def traced_route
    @traced_route||=traced_routes.find(params[:traced_route_id])
  end

  def traced_routes
    @traced_routes||=device.traced_routes.paginate(:page => params[:page])
  end

  def graph
    @variable1 = ""
    traced_route.collected_measurements.each do |cm|
      if @variable1.blank?
        @variable1 << "#{cm.variable_measures.first.value}" unless cm.variable_measures.first.nil?
      else
        @variable1 << ",#{cm.variable_measures.first.value}" unless cm.variable_measures.first.nil?
      end
    end
    #@variable1 = "1,4,5,7,1,5"
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
    data = [{"lng" => coordinates.first.longitude, "lat" => coordinates.first.latitude, "picture" => "https://maps.google.com/mapfiles/marker_greenA.png"},  {"lng" => coordinates.last.longitude, "lat" => coordinates.last.latitude, "picture" => "https://maps.google.com/mapfiles/marker_purpleB.png"}]
    p data.to_json
  rescue 
    nil
  end

  def heat_map
    mainlyne = Array.new
    polilynes = Array.new
    coordinates = traced_route.collected_measurements
    i=0
    min=0
    max=85
    coordinates.each do |x|
      puts "#{min}-#{max}"
      value = x.variable_measures.first.value rescue 0
      if min <= value.to_i && value.to_i < max
        polilynes << {"lng"=>x.longitude, "lat"=>x.latitude, "strokeColor"=>"##{value.to_i.to_s.rjust(3,"0")}"}
        puts value
      elsif value.to_i >= max
        mainlyne[i] = polilynes
        i += 1
        puts value
        case max
        when 85
          max = 170
          min = 85
        when 170
          max = 255
          min = 170
        end
        puts "changed1"
        polilynes = Array.new
        polilynes << {"lng"=>x.longitude, "lat"=>x.latitude, "strokeColor"=>"##{value.to_i.to_s.rjust(3,"0")}"}
      elsif value.to_i < min
        mainlyne[i] = polilynes
        i += 1
        puts value
        case min
        when 170
          max = 170
          min = 85
        when 85
          max = 85
          min = 0
        end
        puts "changed2"
        polilynes = Array.new
        polilynes << {"lng"=>x.longitude, "lat"=>x.latitude, "strokeColor"=>"##{value.to_i.to_s.rjust(3,"0")}"}
      end
    end 

    # coordinates.each do |x|
    #   color = coordinates.variable_measures.first.value rescue ""
    #   if polilynes.count < 1
    #     polilynes << {"lng"=>x.longitude, "lat"=>x.latitude, "strokeColor"=>"##{color.to_s.rjust(3,"0")}"}
    #   else
    #     polilynes << {"lng"=>x.longitude, "lat"=>x.latitude, "strokeColor"=>"##{color.to_s.rjust(3,"0")}"}
    #   end
    # end 
    # if coordinates.blank? 
    #   flash.now[:notice] = "There isn't received data for this route"
    # end
    p "hola"
    p polilynes
    p mainlyne
    @heat_map = mainlyne.to_json
  rescue => e
    "#{e.message}"
  end

  def device
    @device||=current_user.devices.includes(:collected_measurements).find(params[:device_id])
  end



end
