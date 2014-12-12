class AddSceduleNextCallToLeadStatuses < ActiveRecord::Migration
  def change
    add_column :lead_statuses, :schedule_next_call, :date
  end
end
