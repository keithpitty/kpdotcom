class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def self.up
    create_table :blog_posts do |t|
      t.string :title
      t.text :post
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :blog_posts
  end
end
