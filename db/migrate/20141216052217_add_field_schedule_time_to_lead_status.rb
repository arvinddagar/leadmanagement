class AddFieldScheduleTimeToLeadStatus < ActiveRecord::Migration
  def change
  	 add_column :lead_statuses, :schedule_next_call_time, :time
  end
end
