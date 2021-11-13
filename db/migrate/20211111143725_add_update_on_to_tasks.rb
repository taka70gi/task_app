class AddUpdateOnToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :update_on, :date
  end
end
