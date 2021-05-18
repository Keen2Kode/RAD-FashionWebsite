class CreateTagItems < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_items do |t|
      t.integer :tag
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
