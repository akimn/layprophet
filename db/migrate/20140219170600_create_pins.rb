class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :title_of_piece
      t.string :brand
      t.string :comment

      t.timestamps
    end
  end
end
