class Assignment < ApplicationRecord
    belongs_to :course
    belongs_to :student

    validates :course_id, presence: true
    validates :student_id, presence: true
    validates :grade, presence: true
    validates :grade, numericality: { only_integer: true }
    validates :grade, numericality: { greater_than_or_equal_to: 0 }
    validates :grade, numericality: { less_than_or_equal_to: 100 }
    validates :name, presence: true
    validates :type, presence: true
    validates :due_date, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "must be in YYYY-MM-DD format" }
end
