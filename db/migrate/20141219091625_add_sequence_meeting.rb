class AddSequenceMeeting < ActiveRecord::Migration
  def change
  	execute "CREATE SEQUENCE meeting_num_seq MINVALUE 01 MAXVALUE 200 START 01 CYCLE"
  end
end
