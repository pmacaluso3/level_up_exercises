class SetDefaultCorrectToFalse < ActiveRecord::Migration
  def change
    change_column :quotes_rounds, :correct, :boolean, :default => false
  end
end
