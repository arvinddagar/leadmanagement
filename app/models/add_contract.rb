class AddContract < ActiveRecord::Base
	PLANS = ["1 month", "2 month","quaterly","half yearly","yearly"]
	STATUS=["active","expired"]
	WORKSTATUS=["Work not started","work started","ready for deployment","handed over to client","Working on revision","freezed"]
end
