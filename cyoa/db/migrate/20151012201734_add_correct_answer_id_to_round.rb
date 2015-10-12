class AddCorrectAnswerIdToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :correct_answer_id, :integer
  end
end
