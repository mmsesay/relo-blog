class AddCommenterToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :commenter, :string
  end
end
