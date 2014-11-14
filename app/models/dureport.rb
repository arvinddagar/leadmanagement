class Dureport < ActiveRecord::Base
	validate :business , presence: true
end
