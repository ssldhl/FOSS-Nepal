class RemoveDiscussionFromMeetings < ActiveRecord::Migration
  def up
  	remove_column :meetings, :discussion
  end

  def down
  	add_column :meetings, :discussion, :text
  end
end
