json.extract! item, :id, :name, :description, :image_link, :price, :arrival_date, :created_at, :updated_at
json.url item_url(item, format: :json)
