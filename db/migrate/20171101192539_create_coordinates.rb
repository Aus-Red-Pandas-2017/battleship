class CreateCoordinates < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinates do |t|
      t.string :x_position
      t.integer :y_position
      t.boolean :is_hit

      t.timestamps
    end
  end
end
