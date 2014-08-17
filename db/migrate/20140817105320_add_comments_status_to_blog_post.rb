class AddCommentsStatusToBlogPost < ActiveRecord::Migration
  def change
    add_column :blog_posts, :comments_open, :boolean
  end
end
