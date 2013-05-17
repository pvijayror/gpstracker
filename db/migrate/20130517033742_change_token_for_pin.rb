class ChangeTokenForPin < ActiveRecord::Migration
  def change
    rename_column :devices, :token, :pin
    add_column :api_keys, :udi, :string, :default => nil, :after => "email"
  end
end
