class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer  :user_id
      t.string   :serial_number,  :null => false
      t.string   :token,          :null => false    
      t.boolean  :disabled,       :default => false
      t.timestamps
    end
  end
end
