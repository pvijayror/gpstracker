class AddTracedRouteIdToCollectedMeasurements < ActiveRecord::Migration
  def change
    add_column :collected_measurements, :traced_route_id, :integer
  end
end
