class Administrator::DashboardController < ApplicationController
  
  before_filter :authenticate_administrator!
  layout 'admin_application'
  def index; end
end
