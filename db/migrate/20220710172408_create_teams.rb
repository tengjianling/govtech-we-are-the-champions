class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.date :registration_date
      t.integer :group

      t.timestamps
    end
  end
end
