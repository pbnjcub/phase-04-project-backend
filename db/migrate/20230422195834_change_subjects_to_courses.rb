class ChangeSubjectsToCourses < ActiveRecord::Migration[7.0]
  def change
    rename_table :subjects, :courses
  end
end
