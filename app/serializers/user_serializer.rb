class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :created_at, :updated_at
  has_one :teacher

  def include_teacher?
    object.teacher.present?
  end

end
