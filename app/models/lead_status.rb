class LeadStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :daily_update

  PERSON_TYPES = ["Hot Client", "Interested", "Not Interested"]
end
