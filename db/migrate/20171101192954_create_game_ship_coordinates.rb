class CreateGameShipCoordinates < ActiveRecord::Migration[5.1]
  def change
    create_table :game_ship_coordinates do |t|
      t.integer :game_ship_id
      t.integer :coordinate_id
      t.boolean :is_hit

      t.timestamps
    end
  end
end
