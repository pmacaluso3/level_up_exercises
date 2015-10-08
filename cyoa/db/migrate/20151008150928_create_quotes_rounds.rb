class CreateQuotesRounds < ActiveRecord::Migration
  def change
    create_table :quotes_rounds do |t|
    	t.references :quotes
    	t.references :round
    	t.boolean :correct

    	t.timestamps
    end
  end
end
