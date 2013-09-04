class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.date :meeting_date
      t.string :name
      t.string :info
      t.text :discussion
      t.string :venue

      t.timestamps
    end
  end
end
