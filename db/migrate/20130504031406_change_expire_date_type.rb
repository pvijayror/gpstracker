class ChangeExpireDateType < ActiveRecord::Migration
  def up
    change_column :api_keys, :expiry_date, :datetime
  end

  def down
    change_column :api_keys, :expiry_date, :date
  end
end
