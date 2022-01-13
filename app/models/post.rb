class Post < ApplicationRecord
  belongs_to :author
  belongs_to :likes_counter
  belongs_to :comment_counter
end
