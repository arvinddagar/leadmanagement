class AddCategoryColumnToDailyUpdate < ActiveRecord::Migration
  def change
    add_column :daily_updates, :category_id, :integer
  end
end
