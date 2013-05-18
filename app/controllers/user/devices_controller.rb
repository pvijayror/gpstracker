class User::DevicesController < ApplicationController

  before_filter :authenticate_user!

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
      if device.valid_pin?(params[:device][:pin])
        device.user = current_user
        device.save
        flash[:success] = "Device added"
        redirect_to user_devices_path
      else
        flash[:error] = "Serial number or pin is incorrect"
        redirect_to register_device_user_devices_path
      end
    else
      flash[:error] = "Device not found"
      redirect_to register_device_user_devices_path
    end
  end

  def create_tracking_route
    traced_route = device.traced_routes.new(params[:traced_route])
    traced_route.update_attributes(:start_datetime => Time.now)
    if traced_route.save
      flash[:success] = "Tracking route"
      redirect_to user_devices_path
    else
      flash[:error] = "Tracking unable to start"
      redirect_to user_devices_path
    end
  end
  
  def finish_tracking_route
    if device.traced_routes.last.finish   
      flash[:success] = "Tracking Route was finished"
      redirect_to user_devices_path 
    else
      flash[:error] = "Tracking unable to finish"
      redirect_to user_devices_path
    end
  end

  def cancel_tracking_route
    if device.traced_routes.last.cancel   
      flash[:success] = "Tracking Route was canceled"
      redirect_to user_devices_path 
    else
      flash[:error] = "Tracking unable to cancel"
      redirect_to user_devices_path
    end
  end

  helper_method :devices, :device

  def device
    @device||=current_user.devices.includes(:collected_measurements).find_by_disabled_and_id(false, params[:device_id])
  end

  def devices
    @devices||=current_user.devices.includes(:collected_measurements).where(:disabled => false).paginate(:page => params[:page])
  end

end
