class AddRequestColumnsToComments < ActiveRecord::Migration[5.2]
  def self.up
    add_column :comments, :user_ip, :string
    add_column :comments, :user_agent, :string
    add_column :comments, :referrer, :string
    add_column :comments, :approved, :boolean, :default => false, :null => false
    Comment.update_all("approved=true")
  end

  def self.down
    remove_column :comments, :user_ip
    remove_column :comments, :user_agent
    remove_column :comments, :referrer
    remove_column :comments, :approved
  end
end
