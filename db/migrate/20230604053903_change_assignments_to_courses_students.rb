class ChangeAssignmentsToCoursesStudents < ActiveRecord::Migration[7.0]
  def change
    rename_table :assignments, :coursesstudents
  end
end
