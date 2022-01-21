require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = User.new(id: 1, name: 'Fred', bio: 'I am a content creator', photo: '', posts_counter: 0)
    @post = Post.new(title: 'First Post', text: 'Text...', comments_counter: 0, likes_counter: 1, author_id: @user.id)
    @like = Like.new(author_id: @user.id, post_id: @user.id)
  end

  describe 'validation tests' do
    it 'validates the author_id is an integer' do
      @like.author_id = 1
      expect(@like.author_id).to eq(1)
    end

    it 'validates the author name' do
      expect(@like.author.name).to eq('Fred')
    end

    it 'validates the post_id is an integer' do
      @like.post_id = 1
      expect(@like.post_id).to eq(1)
    end

    it 'validates the post title' do
      expect(@like.post.title).to eq('First Post')
    end
  end

  describe 'like model methods tests' do
    it 'it should increment the post likes_counter' do
      @post.save
      @like.update_likes_counter
      expect(@post.likes_counter).to eq(1)
    end
  end
end
