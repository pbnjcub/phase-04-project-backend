class CourseSerializer < ActiveModel::Serializer
  attributes :name, :teacher_id, :id, :teacher

  has_many :courses_students
  has_many :students, through: :courses_students
end
