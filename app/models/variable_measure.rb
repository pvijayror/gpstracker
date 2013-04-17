class VariableMeasure < ActiveRecord::Base

  attr_accessible :error_quotient, :value, :variation_constant, :collected_measurement_id
  belongs_to :collected_measurement
end
