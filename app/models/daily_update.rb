class DailyUpdate < ActiveRecord::Base
	validates :business, presence: true
	# validates :number
	validates :number, presence: true, uniqueness: true
	has_many :lead_status
	belongs_to :user
	belongs_to :category
	accepts_nested_attributes_for :lead_status
	has_many :schedule_meeting
	# PERSON_TYPES = ["Status","first", "second", "third"]
	ransacker :created_at do
      Arel.sql('date(created_at)')
    end
end
