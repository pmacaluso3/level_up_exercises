class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
    	t.text :content
    	t.boolean :ron_said_it

    	t.timestamps
    end
  end
end
