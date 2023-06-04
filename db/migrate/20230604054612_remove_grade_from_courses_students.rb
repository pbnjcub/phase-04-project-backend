class RemoveGradeFromCoursesStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses_students, :grade, :integer
  end
end
