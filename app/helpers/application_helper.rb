module ApplicationHelper
 def format_date(time)
    time.strftime("%v")
  end
  def format_time(time)
    time.strftime("%I:%M%p")
  end
   def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
  def sc_meeting(m)
    ScheduleMeeting.find(m)

  end
end
