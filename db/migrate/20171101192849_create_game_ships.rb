class CreateGameShips < ActiveRecord::Migration[5.1]
  def change
    create_table :game_ships do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :ship_id


      t.timestamps
    end
  end
end
