require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'John', bio: 'I am a content creator', photo: '', posts_counter: 0)
  post = Post.new(title: 'Post 1', text: 'Text...', comments_counter: 0, likes_counter: 0, author_id: user.id)

  before(:each) { post.save }

  describe 'user validation tests' do
    it 'validates the presence of the title' do
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'validates the presence of the comments_counter' do
      post.comments_counter = nil
      expect(post).to_not be_valid
    end

    it 'validates the numericality of the comments_counter' do
      post.comments_counter = 'comment'
      expect(post).to_not be_valid
    end

    it 'validates the presence of the likes_counter' do
      post.likes_counter = nil
      expect(post).to_not be_valid
    end

    it 'validates the numericality of the likes_counter' do
      post.likes_counter = '1'
      expect(post).to_not be_valid
    end

    it 'validates the presence of the author_id' do
      post.author_id = nil
      expect(post).to_not be_valid
    end
  end

  # describe 'post model methods tests' do
  #   before(:each) { 5.times { |i| Comment.new(text: "Comment #{i}", post_id: post.id) } }

  #   it 'returns the last 3 comments' do
  #     expect(post.recent_comments).to eq(Comment.order(created_at: :desc).limit(3))
  #   end
  # end
end
