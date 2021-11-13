class ChangeDataAllDayTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :all_day, :boolean
  end
end
