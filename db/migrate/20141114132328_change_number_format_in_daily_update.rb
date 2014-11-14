class ChangeNumberFormatInDailyUpdate < ActiveRecord::Migration

  def self.up
    change_column :daily_updates, :number, :string 
  end

  def self.down
    change_column :daily_updates, :number, :integer
  end

end
