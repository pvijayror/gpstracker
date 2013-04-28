class CreateTracedRoutes < ActiveRecord::Migration
  def change
    create_table :traced_routes do |t|
      t.integer   :device_id
      t.string    :description 
      t.datetime  :start_datetime
      t.datetime  :end_datetime
      t.string    :state
      t.timestamps
    end
  end
end
