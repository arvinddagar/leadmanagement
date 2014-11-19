class LeadStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :daily_update

  PERSON_TYPES = ["Interested", "Not Interested"]
end
