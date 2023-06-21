class Course < ApplicationRecord
    has_many :courses_students, dependent: :destroy
    has_many :students, through: :courses_students
    belongs_to :teacher

    validates :name, presence: true
    # validates :teacher_id, presence: true

end
