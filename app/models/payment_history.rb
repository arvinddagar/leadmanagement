class PaymentHistory < ActiveRecord::Base
	TRANSACTION_TYPES=["Cheque","Cash"]
	belongs_to :add_contract
end
