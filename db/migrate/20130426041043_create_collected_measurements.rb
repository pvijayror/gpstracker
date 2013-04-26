class CreateCollectedMeasurements < ActiveRecord::Migration
  def change
    create_table :collected_measurements do |t|

      t.timestamps
    end
  end
end
