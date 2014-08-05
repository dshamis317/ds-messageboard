require 'spec_helper'

describe User do

  describe "#introduction" do

    it "introduces itself" do
      user = User.create({name: "Dmitry", password: 'password'})
      post = Post.new({message: 'This is a test post.'})
      user.posts << post
      actual = user.introduction
      expected = "I am Dmitry and I have 1 post."
      expect(actual).to eq(expected)
    end

  end
end
