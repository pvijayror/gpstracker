class Administrator::UsersController < ApplicationController

  before_filter :authenticate_administrator!
  layout 'admin_application'

  helper_method :users, :user, :new_user

  def user
    @user||=User.find(params[:id])
  end

  def users
    @users||=User.paginate(:page => params[:page])
  end

  def new
    render_form new_user
  end

  def edit
    render_form user
  end

  def create
    if new_user.save
      flash[:success] = t("alerts.created_successfully")
      redirect_to administrator_users_path
    else
      render_form new_user
    end
  end

  def update
    if user.update_attributes(params[:user])
      flash[:success] = t("alerts.updated_successfully")
      redirect_to administrator_users_path
    else
      render_form user
    end
  end

  def destroy
    flash[:success] = t("alerts.destroyed_successfully") if user.destroy
    redirect_to administrator_users_path
  end


  private
  def new_user
    @new_user ||= User.new(params[:user])
  end

end
