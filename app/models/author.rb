
#password:string virtual
#password_confirmantion:String virtual
class Author < ApplicationRecord
    has_secure_password
    validates :email, presence: true, format: {with: /\A\S+@.+\.\S+\z/}, uniqueness: true;
    has_many :articles
    has_many :likes
    has_many :comments
end
