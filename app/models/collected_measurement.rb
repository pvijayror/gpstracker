class CollectedMeasurement < ActiveRecord::Base
  acts_as_gmappable
  attr_accessible :device_id, :latitude, :longitude, :token, :traced_route_id, :address
  belongs_to :device
  belongs_to :traced_route
  has_many :variable_measures

  # reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode

  def gmaps4rails_address
    ""#self.address
  end
end
