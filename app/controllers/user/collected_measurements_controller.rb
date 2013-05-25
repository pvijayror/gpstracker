class User::CollectedMeasurementsController < ApplicationController
  before_filter :needs_subscription
end
