class Administrator::SubscriptionTypesController < ApplicationController

before_filter :authenticate_administrator!
  layout 'admin_application'

  helper_method :subscription_types, :subscription_type, :new_subscription_type

  def subscription_type
    @subscription_type||=SubscriptionType.find(params[:id])
  end

  def subscription_types
    @subscription_types||=SubscriptionType.paginate(:page => params[:page])
  end

  def new
    render_form new_subscription_type
  end

  def edit
    render_form subscription_type
  end

  def create
    if new_subscription_type.save
      flash[:success] = t("alerts.created_successfully")
      redirect_to administrator_subscription_types_path
    else
      render_form new_subscription_type
    end
  end

  def update
    if subscription_type.update_attributes(params[:subscription_type])
      flash[:success] = t("alerts.updated_successfully")
      redirect_to administrator_subscription_types_path
    else
      render_form subscription_type
    end
  end

  def destroy
    flash[:success] = t("alerts.destroyed_successfully") if subscription_type.destroy
    redirect_to administrator_subscription_types_path
  end


  private
  def new_subscription_type
    @new_subscription_type ||= SubscriptionType.new(params[:subscription_type])
  end
  

end
