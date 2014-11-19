class AddColumnToDailyUpdate < ActiveRecord::Migration
  def change
    add_column :daily_updates, :user_id, :integer
  end
end
