class AddGmapsColumnToCollectedMeasurements < ActiveRecord::Migration
  def change
    add_column :collected_measurements, :gmaps, :boolean
  end
end
