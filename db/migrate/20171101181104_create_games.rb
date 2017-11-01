class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.integer :player1_id
      t.integer :player2_id

      t.timestamps
    end
  end
end
