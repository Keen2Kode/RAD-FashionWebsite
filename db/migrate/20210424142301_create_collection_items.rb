class CreateCollectionItems < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_items do |t|
      t.integer :category
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
