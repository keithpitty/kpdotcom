class ActsAsTaggableOnMigration < ActiveRecord::Migration[5.2]
  def self.up
    # Remove old tables from acts_as_taggable_on_steriods plugin
    drop_table :taggings if table_exists? :taggings
    drop_table :tags if table_exists? :tags

    create_table :tags do |t|
      t.string :name
    end

    create_table :taggings do |t|
      t.references :tag

      # You should make sure that the column created is
      # long enough to store the required class names.
      t.references :taggable, :polymorphic => true
      t.references :tagger, :polymorphic => true

      t.string :context

      t.datetime :created_at
    end

    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_id, :taggable_type, :context]
  end

  def self.down
    drop_table :taggings
    drop_table :tags
  end
end
