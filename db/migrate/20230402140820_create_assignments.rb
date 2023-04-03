class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :type
      t.date :due_date
      t.integer :grade
      t.integer :student_id
      t.integer :class_id

      t.timestamps
    end
  end
end
