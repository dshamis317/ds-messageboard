class User < ActiveRecord::Base
  has_many :posts

  def introduction
    posts = User.find(self.id).posts.count
    "I am #{self.name} and I have #{posts} post."
  end
end
