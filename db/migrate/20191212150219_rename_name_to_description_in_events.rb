class RenameNameToDescriptionInEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :name, :description
    change_column :events, :description, :text
  end
end
