class DailyUpdate < ActiveRecord::Base
	validates :business, presence: true
	validates :number, presence: true
	#has_many :status
	#accepts_nested_attributes_for :status

	PERSON_TYPES = ["Status","first", "second", "third"]
	
end
