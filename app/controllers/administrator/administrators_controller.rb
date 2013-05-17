class Administrator::AdministratorsController < ApplicationController
  before_filter :authenticate_administrator!
  layout 'admin_application'

  helper_method :administrators, :administrator, :new_administrator

  def administrator
    @administrator||=Administrator.find(params[:id])
  end

  def administrators
    @administrators||=Administrator.paginate(:page => params[:page])
  end

  def new
    render_form new_administrator
  end

  def edit
    render_form administrator
  end

  def create
    if new_administrator.save
      flash[:success] = t("alerts.created_successfully")
      redirect_to administrator_administrators_path
    else
      render_form new_administrator
    end
  end

  def update
    if administrator.update_attributes(params[:administrator])
      flash[:success] = t("alerts.updated_successfully")
      redirect_to administrator_administrators_path
    else
      render_form administrator
    end
  end

  def destroy
    flash[:success] = t("alerts.destroyed_successfully") if administrator.destroy
    redirect_to administrator_administrators_path
  end


  private
  def new_administrator
    @new_administrator ||= Administrator.new(params[:administrator])
  end
  
end
