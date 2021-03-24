class AddParamToBlogPost < ActiveRecord::Migration[5.2]
  def self.up
    add_column :blog_posts, :param, :string
  end

  def self.down
    remove_column :blog_posts, :param
  end
end
