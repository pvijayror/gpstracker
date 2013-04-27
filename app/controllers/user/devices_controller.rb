class User::DevicesController < ApplicationController

  def location
    if params[:all].blank?
      @json = Device.find_by_id(params[:device_id]).collected_measurements.last.to_gmaps4rails rescue nil
    else
      devices = Device.all
      collected_measurements = Array.new
      devices.each do |device|
        collected_measurements << device.collected_measurements.last if !device.collected_measurements.last.nil?
      end
      @json = collected_measurements.to_gmaps4rails rescue nil
    end
    flash.now[:notice] = "Device appears to be offline" if @json.nil?
  end


  helper_method :devices, :device

  def device
    @device||=Device.includes(:collected_measurements).find(params[:device_id])
  end

  def devices
    @devices||=Device.includes(:collected_measurements).paginate(:page => params[:page])
  end

end
