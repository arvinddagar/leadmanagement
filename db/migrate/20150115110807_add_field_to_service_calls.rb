class AddFieldToServiceCalls < ActiveRecord::Migration
  def change
    add_column :service_calls, :user_id, :integer
  end
end
