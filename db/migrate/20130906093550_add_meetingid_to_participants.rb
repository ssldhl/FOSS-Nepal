class AddMeetingidToParticipants < ActiveRecord::Migration
  def change
  	add_column :participants, :meeting_id, :integer
  end
end
