class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :subscription_id, :null => false
      t.float   :amount
      t.timestamps
    end
  end
end
