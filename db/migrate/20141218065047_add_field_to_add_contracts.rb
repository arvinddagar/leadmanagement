class AddFieldToAddContracts < ActiveRecord::Migration
  def change
    add_column :add_contracts, :work_status, :string
  end
end
