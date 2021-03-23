class CreateComments < ActiveRecord::Migration[5.2]
  def self.up
    create_table :comments do |t|
      t.references :blog_post
      t.string :name, :email, :website
      t.text :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
