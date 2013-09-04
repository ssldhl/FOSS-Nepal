class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
      t.text :result

      t.timestamps
    end
  end
end
