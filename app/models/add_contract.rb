class AddContract < ActiveRecord::Base
	PLANS = ["1 month", "2 month","quaterly","half yearly","yearly"]
	STATUS=["active","expired"]
end
