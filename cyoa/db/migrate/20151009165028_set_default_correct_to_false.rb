class SetDefaultCorrectToFalse < ActiveRecord::Migration
  def change
    change_column :questions_rounds, :correct, :boolean, default: false
  end
end
