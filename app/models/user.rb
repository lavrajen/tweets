# email:string
# password_digest: string

class User < ApplicationRecord
  has_secure_password

  # This makes sure that the email is of an email format and displays the error message if it is not
  validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}

  validates :password_digest, presence: true
  has_one_attached :profile_picture
 
  has_many :tweets

  has_many :followed_users, foreign_key: :follower_id, class_name: "Relationship"
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: "Relationship"
  has_many :followers, through: :following_users

end
