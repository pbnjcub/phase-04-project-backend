class RenameSubjectIdToCourseIdInAssignments < ActiveRecord::Migration[7.0]
  def change
    rename_column :assignments, :subject_id, :course_id
  end
end
