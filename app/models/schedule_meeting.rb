class ScheduleMeeting < ActiveRecord::Base
	belongs_to :daily_update
	ransacker :created_at do
      Arel.sql('date(created_at)')
    end
end
