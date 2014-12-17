module ApplicationHelper
 def format_date(time)
    time.strftime("%v")
  end
  def format_time(time)
    time.strftime("%I:%M%p")
  end
end
