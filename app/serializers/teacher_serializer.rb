class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :courses, :user_id

  has_many :courses
  belongs_to :user
end
