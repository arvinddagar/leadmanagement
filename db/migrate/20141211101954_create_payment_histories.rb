class CreatePaymentHistories < ActiveRecord::Migration
  def change
    create_table :payment_histories do |t|
      t.date :collection_date
      t.float :amount
      t.string :transaction_type
      t.string :cheque_no
      t.string :bank_name
      t.date :cheque_date
      t.integer :add_contract_id

      t.timestamps
    end
  end
end
