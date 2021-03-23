class CreateContacts < ActiveRecord::Migration[5.2]
  def self.up
    create_table :contacts do |t|
      t.string :name, :email, :subject
      t.text :message
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
