class Device < ActiveRecord::Base
  attr_accessible :serial_number, :pin, :user_id, :disabled

  belongs_to :user
  has_many   :collected_measurements
  has_many   :traced_routes
  has_many   :api_keys

  validates :serial_number, :presence => true
  validates :serial_number, :uniqueness => true
  validates :pin          , :presence => true
  validates :serial_number, :length => { :is => 8 }
  validates :pin          , :length => { :is => 4 }


  class << self
    def find_for_authentication serial_number
      Device.find_by_disabled_and_serial_number(false, serial_number)
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
