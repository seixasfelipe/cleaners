class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.boolean :closed, null: false, default: false
      t.decimal :value
      t.references :vehicle, null: false

      t.timestamps
    end

    add_index :orders, :vehicle_id
    add_index :orders, :closed
  end
end
