class Like < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'post_id'
end
