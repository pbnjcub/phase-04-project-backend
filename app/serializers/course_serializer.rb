class CourseSerializer < ActiveModel::Serializer
  attributes :name, :teacher_id, :id, :teacher, :students, :courses_students

  has_many :courses_students
  has_many :students, through: :courses_students
end
