class NotificationMailer < ActionMailer::Base
  default from: "from@example.com"
  def expiry_notification(user)
  	binding.pry
    mail(:to => user.email, :subject => "Registered", :from => "eifion@asciicasts.com")
  end
end
