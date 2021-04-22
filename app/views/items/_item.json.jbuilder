json.extract! item, :id, :name, :description, :size, :colour, :image_link, :price, :purchases_count, :stock_count, :arrival_date, :created_at, :updated_at
json.url item_url(item, format: :json)
