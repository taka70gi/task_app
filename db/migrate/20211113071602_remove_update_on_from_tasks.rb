class RemoveUpdateOnFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :update_on, :date
  end
end
