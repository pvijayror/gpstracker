class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string  :key
      t.integer :user_id
      t.integer :device_id
      t.string  :serial_number
      t.string  :email
      t.date    :expiry_date
      t.timestamps
    end
  end
end
