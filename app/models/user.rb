class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, 
                                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  # this method does a bunch of things:
  # 1. it creates the password digest and puts it into the database
  # 2. it includes an authenticate method that takes a password, makes its digest, 
  #    then compares to the existing password digest
  #    if it matches, it returns the user
  # 3. this is also making sure password and password_confirmation are the same
end
