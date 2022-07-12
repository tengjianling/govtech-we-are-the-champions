class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.string "name"
      t.integer "points"
      t.integer "goals"
      t.integer "alternative_points"
      t.integer  "group"
      t.date "registration_date"
      t.timestamps
    end
  end
end
