class User::DevicesController < ApplicationController

  def location
    if params[:all].blank?
      @json = Device.find_by_id(params[:device_id]).collected_measurements.last.to_gmaps4rails rescue nil
    else
      devices = current_user.devices
      collected_measurements = Array.new
      devices.each do |device|
        collected_measurements << device.collected_measurements.last if !device.collected_measurements.last.nil?
      end
      p collected_measurements
      @json = collected_measurements.to_gmaps4rails rescue nil
    end
    flash.now[:notice] = "Device appears to be offline" if @json.nil?
  end

  def assign_device
    device = Device.find_for_authentication(params[:device][:serial_number])
    if device  
      if device.valid_token?(params[:device][:token])
        device.user = current_user
        device.save
        flash[:success] = "Device added"
        redirect_to user_devices_path
      else
        flash[:error] = "Serial number or token is incorrect"
        redirect_to register_device_user_devices_path
      end
    else
      flash[:error] = "Device not found"
      redirect_to register_device_user_devices_path
    end
  end

  def register_device; end

  helper_method :devices, :device

  def device
    @device||=current_user.devices.includes(:collected_measurements).find(params[:device_id])
  end

  def devices
    @devices||=current_user.devices.includes(:collected_measurements).paginate(:page => params[:page])
  end

end
