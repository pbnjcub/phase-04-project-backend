class User < ApplicationRecord
    has_one :teacher
    accepts_nested_attributes_for :teacher
    validates :username, presence: true, uniqueness: true
    # validates :password, presence: true
    has_secure_password #(comes from BCryptgives us password=which salts and hashes our password and stores it as password_digest
end
