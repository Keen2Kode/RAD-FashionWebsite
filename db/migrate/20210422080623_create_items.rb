class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.text :image_link
      t.float :price
      t.date :arrival_date

      t.timestamps
    end
  end
end
