class AddAddressToCollected < ActiveRecord::Migration
  def change
    add_column :collected_measurements, :address, :string
  end
end
