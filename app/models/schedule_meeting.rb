class ScheduleMeeting < ActiveRecord::Base
	belongs_to :daily_update
	ransacker :created_at do
      Arel.sql('date(created_at)')
    end
delegate :contact_person, :to => :daily_update, :prefix => true
delegate :number, :to => :daily_update, :prefix => true
delegate :business, :to => :daily_update, :prefix => true
end
