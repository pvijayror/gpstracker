class CollectedMeasurement < ActiveRecord::Base
  acts_as_gmappable
  attr_accessible :device_id, :latitude, :longitude, :token, :traced_route_id
  belongs_to :device
  belongs_to :traced_route
  has_many :variable_measures

  def gmaps4rails_address
    ""
  end
end
