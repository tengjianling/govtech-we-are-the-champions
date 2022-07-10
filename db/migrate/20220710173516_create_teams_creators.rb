class CreateTeamsCreators < ActiveRecord::Migration[7.0]
  def change
    create_table :teams_creators do |t|
      t.text :user_input

      t.timestamps
    end
  end
end
