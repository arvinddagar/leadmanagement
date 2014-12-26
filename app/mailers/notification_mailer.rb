class NotificationMailer < ActionMailer::Base
  default from: "from@example.com"
  def expiry_notification(user,contract)
  	@user=user
  	@plan=Plan.where(:add_contract_id=>contract).last.renewal_date
  	@contract=AddContract.find(contract).domain_name
    mail(:to => user.email, :subject => "Registered", :from => "eifion@asciicasts.com")
  end
end
