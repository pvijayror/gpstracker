class CollectedMeasurement < ActiveRecord::Base
  acts_as_gmappable
  attr_accessible :device_id, :latitude, :longitude, :token
  belongs_to :device
  has_many :variable_measures

  def gmaps4rails_address
    "#{address}, #{city}"
  end
end
