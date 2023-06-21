class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :courses, :courses_students

  has_many :courses_students
  has_many :courses, through: :courses_students
end
