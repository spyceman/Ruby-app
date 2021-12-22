class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    enum role: [ :admin, :author ]
end
