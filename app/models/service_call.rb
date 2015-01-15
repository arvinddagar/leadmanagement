class ServiceCall < ActiveRecord::Base
	belongs_to :add_contract
	belongs_to :user
end
