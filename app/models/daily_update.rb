class DailyUpdate < ActiveRecord::Base
	validates :business, presence: true
	validates :number, presence: true
	has_many :lead_status
	belongs_to :user
	accepts_nested_attributes_for :lead_status
	# PERSON_TYPES = ["Status","first", "second", "third"]
	
end
