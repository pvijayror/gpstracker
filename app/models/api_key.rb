class ApiKey < ActiveRecord::Base
  attr_accessible :user_id, :device_id, :key, :serial_number, :udi, :expiry_date
  belongs_to :device
end
