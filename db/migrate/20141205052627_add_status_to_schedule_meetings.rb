class AddStatusToScheduleMeetings < ActiveRecord::Migration
  def change
    add_column :schedule_meetings, :status, :text
  end
end
