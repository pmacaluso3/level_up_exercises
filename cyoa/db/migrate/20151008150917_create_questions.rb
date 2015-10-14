class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.boolean :ron_said_it

      t.timestamps
    end
  end
end
