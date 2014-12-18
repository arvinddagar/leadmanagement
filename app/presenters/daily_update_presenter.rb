class DailyUpdatePresenter< BasePresenter
presents :daily_update

def lead_check
  daily_update.lead_status.present?
end
def client_check
  daily_update.lead_status.last.state.present? && DailyUpdate.client(daily_update.id).lead_status.last.state !="Client"
end
end