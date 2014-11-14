class ChangeNumberFormatInDailyUpdate < ActiveRecord::Migration
  def change
  	change_column :daily_updates, :number, :string
  end
end
