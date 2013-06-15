class User::CollectedMeasurementsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :needs_subscription

  helper_method :collected_measurements, :collected_measurement, :devices, :device

  def collected_measurement
    @collected_measurement||=collected_measurements.find(params[:collected_measurement_id])
  end

  def collected_measurements
    @collected_measurements||=device.collected_measurements#.paginate(:page => params[:page])
  end

  def device
    @device||=current_user.devices.includes(:collected_measurements).find_by_disabled_and_id(false, params[:device_id])
  end

  def devices
    @devices||=current_user.devices.includes(:collected_measurements).where(:disabled => false).paginate(:page => params[:page])
  end
end
