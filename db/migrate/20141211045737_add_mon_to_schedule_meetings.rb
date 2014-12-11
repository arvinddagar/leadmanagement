class AddMonToScheduleMeetings < ActiveRecord::Migration
  def change
    add_column :schedule_meetings, :mom, :text
  end
end
