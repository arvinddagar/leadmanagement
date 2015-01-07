class AddContract < ActiveRecord::Base
	PLANS = ["1 month", "2 month","quaterly","half yearly","yearly"]
	STATUS=["active","expired"]
	WORKSTATUS=["Work not started","Work started","Ready for deployment","Handed over to client","Working on revision","Freezed"]
  has_many :plans
  belongs_to :daily_update
  ransacker :renewal_date do
    Arel.sql('date(renewal_date)')
  end
  has_many :payment_histories
end
