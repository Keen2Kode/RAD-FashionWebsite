class CreateBagItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bag_items do |t|
      t.integer :quantity
      t.references :item_variant, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
