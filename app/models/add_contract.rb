class AddContract < ActiveRecord::Base
	PLANS = ["1 month", "2 month","quaterly","half yearly","yearly"]
	STATUS=["active","expired"]
	WORKSTATUS=["Work not started","Work started","Ready for deployment","Handed over to client","Working on revision","Freezed"]
end
