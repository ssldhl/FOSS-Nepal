class AddMeetingidToLocations < ActiveRecord::Migration
  def change
  	add_column :locations, :meeting_id, :integer
  end
end
