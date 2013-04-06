class ApiKey < ActiveRecord::Base
  attr_accessible :user_id, :device_id, :key, :serial_number, :expiry_date
end
