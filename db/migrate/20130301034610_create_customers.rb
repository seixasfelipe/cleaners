class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.datetime :birth_date
      t.string :mobile_number

      t.timestamps
    end
  end
end
