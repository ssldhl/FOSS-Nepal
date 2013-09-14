class CreateElocations < ActiveRecord::Migration
  def change
    create_table :elocations do |t|
      t.float :latitude, default: 27.693852455795415
      t.float :longitude, default: 85.31417280435562
      t.integer :gmaps_zoom, default: 19

      t.timestamps
    end
  end
end
