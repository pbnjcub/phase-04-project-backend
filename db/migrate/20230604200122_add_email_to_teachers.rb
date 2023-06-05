class AddEmailToTeachers < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :email, :string
  end
end
