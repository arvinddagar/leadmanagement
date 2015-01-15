class AddPriorityToAddContracts < ActiveRecord::Migration
  def change
    add_column :add_contracts, :priority, :string
  end
end
