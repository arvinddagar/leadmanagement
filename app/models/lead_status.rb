class LeadStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :daily_update
end
