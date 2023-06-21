class CoursesStudentSerializer < ActiveModel::Serializer
  attributes :id, :course_id, :student_id, :course, :student, :grade

  belongs_to :course
  belongs_to :student
end
