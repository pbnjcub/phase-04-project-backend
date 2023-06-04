class RemoveNameFromCoursesStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses_students, :name, :string
  end
end
