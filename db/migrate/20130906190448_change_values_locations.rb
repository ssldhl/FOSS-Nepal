class ChangeValuesLocations < ActiveRecord::Migration
  def up
  	change_column :locations, :longitude, :float, default: 85.31417280435562
  	change_column :locations, :latitude, :float, default: 27.693852455795415
  	change_column :locations, :gmaps_zoom, :integer, default: 19
  end

  def down
  end
end
