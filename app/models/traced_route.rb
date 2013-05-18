class TracedRoute < ActiveRecord::Base
  attr_accessible :device_id, :description, :start_datetime, :end_datetime, :state

  belongs_to :device
  has_many :collected_measurements

  state_machine :state, :initial => :pending do 
    state :tracking, :finished, :canceled
    event :track do
      transition :pending => :tracking
    end
    event :finish do
      transition :tracking => :finished 
    end
    event :cancel do
      transition [:pending, :tracking] => :canceled 
    end
    #after_transition :pending => :tracking, :do => :after_method
  end

end
