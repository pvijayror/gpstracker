class CollectedMeasurements < ActiveRecord::Base
  attr_accessible :device_id, :latitude, :longitude, :token
  belongs_to :device
  has_many :variable_measures
end
