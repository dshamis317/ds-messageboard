require 'spec_helper'

describe Post do
  before :each do
    @user = User.create({name: "Dmitry", password: 'password'})
    @post = Post.new({message: 'This is a test post.', user_id: @user.id})
    @user.posts << @post
  end

  it 'has a message' do
    actual = @post.message
    expected = "This is a test post."
    expect(actual).to eq(expected)
  end

  it 'belongs to a user' do
    actual = @post.user_id
    expected = @user.id
    expect(actual).to eq(expected)
  end
end
