class AddCommentsStatusToBlogPost < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :comments_open, :boolean
  end
end
