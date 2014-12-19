class AddMeetingNoToScheduleMeetings < ActiveRecord::Migration
  def change
    add_column :schedule_meetings, :meeting_no, :string
  end
end
