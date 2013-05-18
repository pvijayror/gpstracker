class Administrator::DevicesController < ApplicationController

  before_filter :authenticate_administrator!
  layout 'admin_application'
  helper_method :devices, :device, :new_device

  def device
    @device||=Device.find_by_disabled_and_id(false, params[:id])
  end

  def devices
    @devices||=Device.where(:disabled => false).paginate(:page => params[:page])
  end

  def new
    render_form new_device
  end

  def edit
    render_form device
  end

  def create
    if new_device.save
      flash[:success] = t("alerts.created_successfully")
      redirect_to administrator_devices_path
    else
      render_form new_device
    end
  end

  def update
    if device.update_attributes(params[:device])
      flash[:success] = t("alerts.updated_successfully")
      redirect_to administrator_devices_path
    else
      render_form device
    end
  end

  def destroy
    device.disabled = true
    flash[:success] = t("alerts.destroyed_successfully") if device.save
    redirect_to administrator_devices_path
  end


  private
  def new_device
    @new_device ||= Device.new(params[:device])
  end
  
end
