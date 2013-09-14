class AddRelationToEvent < ActiveRecord::Migration
  def change
  	add_column :econtacts, :event_id, :integer
  	add_column :elocations, :event_id, :integer
  	add_column :eventlists, :event_id, :integer
  	add_column :results, :event_id, :integer
  end
end
