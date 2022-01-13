class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: { to_table: 'users' }
      t.reference :comment_counter
      t.reference :likes_counter
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
