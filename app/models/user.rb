class User < ApplicationRecord

    validates :name, presence: true
    validates :firstname, presence: true
    validates :email, :presence => true, :uniqueness => true

end
