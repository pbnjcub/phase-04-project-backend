class AddTeacherIdToSubject < ActiveRecord::Migration[7.0]
  def change
    add_column :subjects, :teacher_id, :integer
  end
end
