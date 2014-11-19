class AddColumnToLeadStatus < ActiveRecord::Migration
  def change
    add_column :lead_statuses, :comment, :text
  end
end
