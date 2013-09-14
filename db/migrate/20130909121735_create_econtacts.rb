class CreateEcontacts < ActiveRecord::Migration
  def change
    create_table :econtacts do |t|
      t.string :name
      t.string :contact

      t.timestamps
    end
  end
end
