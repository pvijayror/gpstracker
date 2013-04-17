class CreateVariableMeasures < ActiveRecord::Migration
  def change
    create_table :variable_measures do |t|
      t.float :value
      t.float :variation_constant
      t.float :error_quotient
      t.integer :collected_measurement_id
      t.timestamps
    end
  end
end
