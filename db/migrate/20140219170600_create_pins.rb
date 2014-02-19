class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :title_Of_Piece
      t.string :brand
      t.string :comment

      t.timestamps
    end
  end
end
