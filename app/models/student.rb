class Student < ApplicationRecord
    has_many :courses_students, dependent: :destroy
    has_many :courses, through: :courses_students

    validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
