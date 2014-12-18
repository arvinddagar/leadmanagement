class DailyUpdate < ActiveRecord::Base
	validates :business, presence: true
	scope :client, lambda {|id| find(id)}
	validates :number, presence: true, uniqueness: true
	has_many :lead_status
	belongs_to :user
	belongs_to :category
	accepts_nested_attributes_for :lead_status
	has_many :schedule_meeting
	ransacker :created_at do
    Arel.sql('date(created_at)')
  end
#   def self.with_lead
#   joins(:lead_status).group('lead_status.id').select('daily_update.*, count(lead_status.id) as lead_status_count')
# end
end
