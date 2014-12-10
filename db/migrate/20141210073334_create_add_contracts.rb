class CreateAddContracts < ActiveRecord::Migration
  def change
    create_table :add_contracts do |t|
      t.string :domain_name
      t.string :renewal_date
      t.string :plan
      t.string :client_name
      t.integer :client_id
      t.string :status

      t.timestamps
    end
  end
end
