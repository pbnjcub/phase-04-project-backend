class Course < ApplicationRecord
    has_many :assignments, dependent: :destroy
    has_many :students, through: :assignments
    belongs_to :teacher

    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :teacher_id, presence: true

end
