class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :registration_id
      t.integer :opponent_id
      t.integer :registration_score
      t.integer :opponent_score

      t.timestamps
    end
  end
end
