class CourseSerializer < ActiveModel::Serializer
  attributes :name, :teacher_id, :id, :teacher

  has_many :assignments
  has_many :students
end
