class CreateCollectedMeasurements < ActiveRecord::Migration
  def change
    drop_table :collected_measurements
    create_table :collected_measurements do |t|
      t.integer :device_id
      t.float :longitude
      t.float :latitude
      t.string :token
      t.timestamps
    end
  end
end
