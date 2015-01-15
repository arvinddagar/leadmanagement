class CreateServiceCalls < ActiveRecord::Migration
  def change
    create_table :service_calls do |t|
      t.text :description
      t.integer :add_contract_id

      t.timestamps
    end
  end
end
