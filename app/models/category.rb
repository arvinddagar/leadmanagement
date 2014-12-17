class Category < ActiveRecord::Base
  has_many :daily_updates
end
