class Device < ActiveRecord::Base
  attr_accessible :serial_number, :token, :user_id, :disabled

  belongs_to :user
  has_many   :collected_measurements
  has_many   :traced_routes
  has_many   :api_keys

  class << self
    def find_for_authentication serial_number
      Device.find_by_serial_number(serial_number)
    end
  end

  def valid_token? input_token
    return false if token.blank?
    compare_token(input_token)
  end

  private
  def compare_token input_token
    input_token == token ? true : false    
  end
end
