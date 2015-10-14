class RenameRonSaidItToName < ActiveRecord::Migration
  def change
    rename_column :questions, :ron_said_it, :name
  end
end
