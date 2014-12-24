class LeadStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :daily_update
  PERSON_TYPES = ["Interested", "Not Interested","Client","Already website","Not Picked"]
  STATUS=[["Not Called",0],["Called",1]]
  delegate :contact_person, :to => :daily_update, :prefix => true
  delegate :number, :to => :daily_update, :prefix => true
  delegate :business, :to => :daily_update, :prefix => true
  delegate :name, :to => :user, :prefix => true
  ransacker :created_at do
      Arel.sql('date(created_at)')
    end
end
