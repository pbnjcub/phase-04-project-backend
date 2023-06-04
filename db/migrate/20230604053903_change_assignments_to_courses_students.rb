class ChangeAssignmentsToCoursesStudents < ActiveRecord::Migration[7.0]
  def change
    rename_table :assignments, :courses_students
  end
end
