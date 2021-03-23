class AddPublishedAtToBlogPost < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :published_at, :timestamp
  end
end
