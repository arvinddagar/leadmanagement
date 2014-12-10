class ScheduleMeeting < ActiveRecord::Base
	ransacker :created_at do
      Arel.sql('date(created_at)')
    end
end
