class ToRemoveAColumnFromAddContracts < ActiveRecord::Migration
  def change
  	remove_column :add_contracts, :client_id
  	remove_column :add_contracts, :client_name
  	remove_column :add_contracts, :plan
  	remove_column :add_contracts, :renewal_date
  end
end
