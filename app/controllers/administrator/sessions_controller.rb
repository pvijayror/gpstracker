class Administrator::SessionsController < Devise::SessionsController
  before_filter :require_no_authentication, :only => [:new,:create]
  layout 'admin_application'
end