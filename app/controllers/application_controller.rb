class ApplicationController < ActionController::Base
  # protect_from_forgery

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def needs_subscription
    if current_user
      if current_user.subscriptions.blank? || !current_user.subscriptions.last.active?
        redirect_to user_dashboard_subscribe_path
      end
    end
  end

  # Current action
  def current_action
    params[:action]
  end

  # Current model name based on the controller name
  def current_model_name
    @current_model_name ||= current_controller.singularize
  end

  helper_method :c_t, :a_t, :current_model, :current_controller, :search?

  # Attribute translation
  def a_t attribute, model_name = current_model_name
    t "activerecord.attributes.#{model_name}.#{attribute}"
  end

  # Controller translation
  def c_t action = :index, controller = current_controller
    t "controllers.#{controller}.#{action}"
  end

  # Current controller name
  def current_controller
    @current_controller ||= params[:controller]["/"] ? params[:controller][/\/.+/][1..-1] : params[:controller]
  end

  # Current model
  def current_model
    @current_model ||= current_model_name.camelize.constantize
  end

  # # Show search?
  # def search?
  #   true
  # end

  private

  # Render form
  def render_form instance, layout = nil
    if layout.nil?
      render "form", :locals => {current_model_name.to_sym => instance}
    elsif
      render "form", :locals => {current_model_name.to_sym => instance}, :layout => layout
    end
  end

  # Error
  def error action = current_action
    flash[:error] = t("front_end.errors.#{current_controller}.#{action}")
  end

  # Record not found
  def record_not_found
    redirect_to root_path(:error => 404)
  end

  # def current_ability
  #   if current_administrator
  #     current_administrator.ability
  #   elsif current_user
  #     current_user.ability
  #   else
  #     UserAbility
  #   end
  # end
end
