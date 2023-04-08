class RemoveTeacherFromSubjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :subjects, :teacher
  end
end
