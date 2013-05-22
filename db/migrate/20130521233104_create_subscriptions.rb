class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, :null => false
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
