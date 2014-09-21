class AddPublishedAtToBlogPost < ActiveRecord::Migration
  def change
    add_column :blog_posts, :published_at, :timestamp
  end
end
