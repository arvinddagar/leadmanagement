class CreateDailyUpdates < ActiveRecord::Migration
  def change
    create_table :daily_updates do |t|
      t.string :business
      t.string :contact_person
      t.integer :number
      t.string :designation
      t.string :status
      t.text :summary
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
