class CreateQuestionsRounds < ActiveRecord::Migration
  def change
    create_table :questions_rounds do |t|
      t.references :question
      t.references :round
      t.boolean :correct

      t.timestamps
    end
  end
end
