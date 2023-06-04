class CoursesStudent < ApplicationRecord
    belongs_to :course
    belongs_to :student

    validates :course_id, presence: true
    validates :student_id, presence: true

end
