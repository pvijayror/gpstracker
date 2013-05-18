class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :telephone, :string
    add_column :users, :cellphone, :string
  end
end
