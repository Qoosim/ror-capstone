class User < ApplicationRecord
  before_save { self.email = email.downcase }
  acts_as_voter

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6, maximum: 255 }
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } 


  has_many :articles

  has_secure_password
end
