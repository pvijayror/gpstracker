class CreateSubscriptionTypes < ActiveRecord::Migration
  def change
    create_table :subscription_types do |t|
      t.float   :price
      t.integer :months
      t.string  :description
      t.string  :translation
      t.timestamps
    end
  end
end
