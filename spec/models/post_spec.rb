require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) { 
    @user = User.new(name: 'John', bio: 'I am a content creator', photo: '', posts_counter: 0)
    @post = Post.new(title: 'Post 1', text: 'Text...', comments_counter: 0, likes_counter: 0, author_id: @user.id)
    10.times { |i| Comment.new(text: "Comment #{i}", author_id: @user.id, post_id: @post.id) }

    @comments = Comment.where(post_id: @post.id).where(author_id: @user.id).all
  }

  describe 'user validation tests' do
    it 'validates the presence of the title' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'validates the presence of the comments_counter' do
      @post.comments_counter = nil
      expect(@post).to_not be_valid
    end

    it 'validates the numericality of the comments_counter' do
      @post.comments_counter = 'comment'
      expect(@post).to_not be_valid
    end

    it 'validates the presence of the likes_counter' do
      @post.likes_counter = nil
      expect(@post).to_not be_valid
    end

    it 'validates the numericality of the likes_counter' do
      @post.likes_counter = '1'
      expect(@post).to_not be_valid
    end

    it 'validates the presence of the author_id' do
      @post.author_id = nil
      expect(@post).to_not be_valid
    end
  end

  describe 'post model methods tests' do
    it 'returns the last 5 comments' do
      expect(@post.most_recent_comments).to eq(@comments.order('created_at DESC').limit(5))
    end
  end
end
