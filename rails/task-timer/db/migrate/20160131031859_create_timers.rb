class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.references :task, index: true, foreign_key: true
      t.time :start
      t.time :finish
      t.time :interval
      t.integer :pomodoros

      t.timestamps null: false
    end
  end
end
