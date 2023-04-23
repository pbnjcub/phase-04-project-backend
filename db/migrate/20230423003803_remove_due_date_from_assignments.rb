class RemoveDueDateFromAssignments < ActiveRecord::Migration[7.0]
  def change
    remove_column :assignments, :due_date
  end
end
