class Status < ActiveRecord::Base
	belongs_to :daily_update
	# belongs_to :user
end
