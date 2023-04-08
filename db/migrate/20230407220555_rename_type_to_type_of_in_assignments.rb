class RenameTypeToTypeOfInAssignments < ActiveRecord::Migration[7.0]
  def change
    rename_column :assignments, :type, :type_of
  end
end
