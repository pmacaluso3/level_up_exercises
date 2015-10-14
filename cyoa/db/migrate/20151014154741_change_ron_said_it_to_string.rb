class ChangeRonSaidItToString < ActiveRecord::Migration
  def change
    change_column :questions, :ron_said_it, :string, null: false
  end
end
