class CreateScheduleMeetings < ActiveRecord::Migration
  def change
    create_table :schedule_meetings do |t|
      t.date :meeting_date
      t.time :meeting_time
      t.text :venue
      t.integer :assigned_to
      t.integer :daily_update_id

      t.timestamps
    end
  end
end
