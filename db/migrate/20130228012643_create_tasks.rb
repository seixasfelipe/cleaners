class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
