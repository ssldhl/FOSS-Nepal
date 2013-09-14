class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :info
      t.datetime :event_time
      t.string :venue

      t.timestamps
    end
  end
end
