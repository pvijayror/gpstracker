class Device < ActiveRecord::Base
  attr_accessible :serial_number, :pin, :user_id, :disabled

  belongs_to :user
  has_many   :collected_measurements
  has_many   :traced_routes
  has_many   :api_keys

  class << self
    def find_for_authentication serial_number
      Device.find_by_serial_number(serial_number)
    end
  end

  def valid_pin? input_pin
    return false if pin.blank?
    compare_pin(input_pin)
  end

  private
  def compare_pin input_pin
    input_pin == pin ? true : false    
  end
end
