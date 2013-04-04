class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :license_plate
      t.string :model
      t.string :color
      t.string :brand
      t.references :customer

      t.timestamps
    end

    add_index :vehicles, :customer_id
    add_index :vehicles, :license_plate
  end
end
