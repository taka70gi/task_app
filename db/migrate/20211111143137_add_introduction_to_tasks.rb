class AddIntroductionToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :introduction, :string
  end
end
