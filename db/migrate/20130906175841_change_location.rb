class ChangeLocation < ActiveRecord::Migration
  def up
  	remove_column :locations, :address
  	remove_column :locations, :gmaps
  	change_column :locations, :longitude, :float, default: 27.7000
  	change_column :locations, :latitude, :float, default: 85.3333
  	add_column :locations, :gmaps_zoom, :integer, default: 0
  end

  def down
  	add_column :locations, :address, :string
  	add_column :locations, :gmaps, :boolean
  end
end
