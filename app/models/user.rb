class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, uniqueness: true, :length => {:within => 4..20, :wrong_length => "needs to be between 4 and 20 characters"}
  validates :password, :length => {:within => 4..20, :wrong_length => "needs to be between 4 and 20 characters"}

  has_many :posts

  def introduction
    posts = User.find(self.id).posts.count
    "I am #{self.name} and I have #{posts} post."
  end
end
