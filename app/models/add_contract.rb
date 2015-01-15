class AddContract < ActiveRecord::Base
	PLANS = ["1 month", "2 month","quaterly","half yearly","yearly"]
	STATUS=["active","expired"]
	WORKSTATUS=["Work not started","Work started","Data Collection Phase","Ready for deployment","Handed over to client","Working on revision","Freezed"]
  PRIORITY = ["Normal", "Medium","High","Urgent"]
  has_many :plans
  has_many :service_calls
  belongs_to :daily_update
  
  ransacker :renewal_date do
    Arel.sql('date(renewal_date)')
  end
  has_many :payment_histories
end
