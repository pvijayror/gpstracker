class AddSomeColumnsToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :card_type, :string
    add_column :payments, :last4,     :string
  end
end
