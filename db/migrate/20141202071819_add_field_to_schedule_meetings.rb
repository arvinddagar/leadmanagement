class AddFieldToScheduleMeetings < ActiveRecord::Migration
  def change
    add_column :schedule_meetings, :notes, :text
  end
end
