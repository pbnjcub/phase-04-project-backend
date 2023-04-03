class Subject < ApplicationRecord
    has_many :assignments, dependent: :destroy
    has_many :students, through: :assignments

    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :teacher, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

end
