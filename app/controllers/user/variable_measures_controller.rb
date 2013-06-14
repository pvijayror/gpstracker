class User::VariableMeasuresController < ApplicationController
  before_filter :authenticate_user!
  before_filter :needs_subscription

  helper_method :variable_measures, :variable_measure

  def variable_measure
    #@variable_measure||=variable_measures.find(params[:traced_route_id])
  end

  def variable_measures
    #@variable_measures||=device.traced_routes.paginate(:page => params[:page])
  end

end

