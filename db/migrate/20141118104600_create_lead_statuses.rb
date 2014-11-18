class CreateLeadStatuses < ActiveRecord::Migration
  def change
    create_table :lead_statuses do |t|
      t.string :state
      t.references :user, index: true
      t.references :daily_update, index: true

      t.timestamps
    end
  end
end
