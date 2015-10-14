class RenameContentToTriviaPiece < ActiveRecord::Migration
  def change
    rename_column :questions, :content, :trivia_piece
  end
end