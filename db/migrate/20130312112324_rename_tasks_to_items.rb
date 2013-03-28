class RenameTasksToItems < ActiveRecord::Migration
  def up
    rename_table :tasks, :items
  end

  def down
    rename_table :items, :tasks
  end
end
