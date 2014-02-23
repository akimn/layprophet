class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :pins, :title_Of_Piece, :title_of_piece
  end
end
