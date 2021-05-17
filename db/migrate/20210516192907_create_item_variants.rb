class CreateItemVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :item_variants do |t|
      t.integer :colour
      t.integer :size
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
