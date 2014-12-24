class NotificationMailer < ActionMailer::Base
  default from: "from@example.com"
  def expiry_notification(user)
    mail(:to => user.email, :subject => "Registered", :from => "eifion@asciicasts.com")
  end
end
