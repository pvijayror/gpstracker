class AddRoleToAdministrators < ActiveRecord::Migration
  def change
    add_column :administrators, :superadmin, :boolean, :default => false
  end
end
