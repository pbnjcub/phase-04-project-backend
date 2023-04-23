class RemoveTypeOfFromAssignments < ActiveRecord::Migration[7.0]
  def change
    remove_column :assignments, :type_of
  end
end
