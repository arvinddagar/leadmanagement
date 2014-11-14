class DailyUpdate < ActiveRecord::Base
	validates :business, presence: true
	validates :number, presence: true
end
