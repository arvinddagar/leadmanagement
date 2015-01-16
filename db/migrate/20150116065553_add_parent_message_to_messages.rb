class AddParentMessageToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :parent_message_id, :integer
  end
end
