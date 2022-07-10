class CreateMatchesCreators < ActiveRecord::Migration[7.0]
  def change
    create_table :matches_creators do |t|
      t.text :user_input

      t.timestamps
    end
  end
end
