class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :district
      t.string :city
      t.string :zip_code
      t.references :state

      t.timestamps
    end
    add_index :addresses, :state_id
  end
end
