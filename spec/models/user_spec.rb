require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) { 
    @user = User.new(name: 'John', bio: 'I am a content creator', photo: '', posts_counter: 0)
    5.times do |i|
      Post.new(title: "Post #{i}", text: "Post #{i} text", comments_counter: 0, likes_counter: 0, author_id: @user.id)
    end

    @posts = Post.where(author_id: @user.id).all
  }

  describe 'user validation tests' do
    it 'validates the presence of the name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'validates the presence of the posts_counter' do
      @user.posts_counter = nil
      expect(@user).to_not be_valid
    end

    it 'validates the numericality of the posts_counter' do
      @user.posts_counter = 'zero'
      expect(@user).to_not be_valid
    end

    it 'validates the posts_counter is greater_than_zero' do
      @user.posts_counter = 5
      expect(@user.posts_counter).to be > 0
    end

    it 'validates the posts_counter is greater_equal_to_zero' do
      @user.posts_counter = 0
      expect(@user.posts_counter).to eq(0)
    end
  end

  describe 'user model methods tests' do
    it 'returns the most recent post limit to 3 posts' do
      expect(@user.most_recent_posts).to eq(@posts.order('created_at DESC').limit(3))
    end
  end
end
