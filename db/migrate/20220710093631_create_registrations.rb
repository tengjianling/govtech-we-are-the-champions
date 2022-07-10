class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.string :name
      t.datetime :date
      t.integer :group

      t.timestamps
    end
  end
end
