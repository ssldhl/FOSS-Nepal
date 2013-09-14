class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.text :description
      t.text :extras

      t.timestamps
    end
  end
end
