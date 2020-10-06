class User < ActiveRecord::Base
    has_many :articles
    has_secure_password
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
    validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false } 
    before_save { self.email = self.email.to_s.downcase }
end