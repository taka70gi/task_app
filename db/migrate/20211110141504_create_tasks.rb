class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :start_on
      t.date :end_on
      t.string :all_day
      t.timestamps
    end
  end
end
