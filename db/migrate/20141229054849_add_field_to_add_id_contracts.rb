class AddFieldToAddIdContracts < ActiveRecord::Migration
  def change
    add_column :add_contracts, :daily_update_id, :integer
  end
end
