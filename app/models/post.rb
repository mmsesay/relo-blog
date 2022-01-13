class Post < ApplicationRecord
  belongs_to :author
  has_many :likes_counter, foreign_key: 'post_id'
  has_many :comment_counter, foreign_key: 'post_id'
end
