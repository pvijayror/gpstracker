class TracedRoute < ActiveRecord::Base
  attr_accessible :device_id, :description, :start_datetime, :end_datetime, :state

  belongs_to :device
end
