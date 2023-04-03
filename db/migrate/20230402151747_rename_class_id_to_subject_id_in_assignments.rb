class RenameClassIdToSubjectIdInAssignments < ActiveRecord::Migration[7.0]
  def change
    rename_column :assignments, :class_id, :subject_id
  end
end
