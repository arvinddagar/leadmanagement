class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :plan_type
      t.date :renewal_date
      t.integer :add_contract_id

      t.timestamps
    end
  end
end
