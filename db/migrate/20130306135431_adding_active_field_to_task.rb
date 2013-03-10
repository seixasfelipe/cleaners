class AddingActiveFieldToTask < ActiveRecord::Migration
  def up
    add_column :tasks, :active, :boolean, null: false, default: true
  end

  def down
    remove_column :tasks, :active
  end
end
