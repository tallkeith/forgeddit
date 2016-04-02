class User < ActiveRecord::Base
	has_many :posts
	has_many :comments

	validates_presence_of :password, :email, :username
  validates :password, length: { minimum: 5 }
  validates :email, format: {
              with: /.+@.+\..+/,  message: "Must have an @ symbol and a period."
            }
end
