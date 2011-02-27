class ChangeUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :login, :string, :null => false
    remove_column :users, :email
    change_column :users, :crypted_password, :string, :null => false
    rename_column :users, :salt, :password_salt
    change_column :users, :password_salt, :string, :null => false
    add_column :users, :persistence_token, :string, :null => false
    remove_column :users, :remember_token
    remove_column :users, :remember_token_expires_at
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
