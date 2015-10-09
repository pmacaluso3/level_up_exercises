class MoveCorrectToRounds < ActiveRecord::Migration
  def change
    remove_column :quotes_rounds, :correct

    add_column :rounds, :correct, :boolean, default: false
  end
end
