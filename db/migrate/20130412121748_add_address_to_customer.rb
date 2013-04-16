class AddAddressToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :address_id, :integer
  end
end
