class Administrator::DevicesController < ApplicationController

  before_filter :authenticate_administrator!
  layout 'admin_application'
  helper_method :devices, :device

  def device
    @device||=Device.find(params[:id])
  end

  def devices
    @devices||=Device.paginate(:page => params[:page])
  end

  def new
    render_form new_device
  end

  def edit
    render_form device
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
    flash[:success] = t("alerts.destroyed_successfully") if device.destroy
    redirect_to administrator_devices_path
  end

#### PROTOTYPES ####

  def new_prot
    flash[:alert] = "(Prototipo)"
  end


  private
  def new_device
    @new_device ||= Device.new(params[:device])
  end
  
end
