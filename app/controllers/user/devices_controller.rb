class User::DevicesController < ApplicationController

  def location
    @json = Device.find_by_id(params[:device_id]).collected_measurements.last.to_gmaps4rails
  end

  helper_method :devices, :device

  def device
    @device||=Device.includes(:collected_measurements).find(params[:device_id])
  end

  def devices
    @devices||=Device.includes(:collected_measurements).paginate(:page => params[:page])
  end

end
