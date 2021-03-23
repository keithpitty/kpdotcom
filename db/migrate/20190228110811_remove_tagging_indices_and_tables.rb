class RemoveTaggingIndicesAndTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :taggings
    drop_table :tags
  end
end
