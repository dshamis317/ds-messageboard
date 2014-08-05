class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true, :length => {:within => 6..20, :wrong_length => "needs to be between 6 and 20 characters"}
  validates :password, :length => {:within => 8..20, :wrong_length => "needs to be between 8 and 20 characters"}

  has_many :posts

  def introduction
    posts = User.find(self.id).posts.count
    "I am #{self.name} and I have #{posts} post."
  end
end
