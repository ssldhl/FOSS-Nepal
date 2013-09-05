class AddRelationToOutcome < ActiveRecord::Migration
  def change
  	add_column :outcomes, :meeting_id, :integer
  end
end
